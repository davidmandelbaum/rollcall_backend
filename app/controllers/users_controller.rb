class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :restrict_access, except: [:create, :login]

  def login
    @phone = params[:phone_number]
    if @phone.length == 10
      @phone = "1" + @phone
    end
    @user = User.find_by phone_number: @phone
    respond_to do |format|
      if params[:password] and @user and @user.password == params[:password]
        @auth_key = AuthKey.where(user: @user).first
        if @auth_key.updated_at < 10.seconds.ago
          @auth_key.generate_token
          @auth_key.save
        end
        format.json { render json: { :auth_key => @auth_key, :user => @user }, status: :ok }
      else
        format.json { render json: "Invalid username/password", status: 401 }
      end
    end
  end
  
  def find_friends
    @users = params[:users]
    @friends = []
    @users.each do |u|
      if User.exists?(phone_number: u.to_s)
        @friends << u
      end
    end
    render json: { :users => @friends }
  end
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.phone_number.length == 10
      @user.phone_number = "1" + @user.phone_number
    end

    respond_to do |format|
      if @user.save
        format.json { render json: { :auth_key => AuthKey.where(user: @user).first, :user => @user }, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:phone_number, :password, :first_name, :last_name, :joined, :last_activity, :email, :UDID, :avatar)
    end
end
