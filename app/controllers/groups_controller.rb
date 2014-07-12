class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  before_action :restrict_access

  # GET /groups
  # GET /groups.json
  def index
    @groups = @current_user.groups
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    params[:users].each do |number|
      @user = User.find_by phone_number: number
      @group.users << @user
    end
    @group.users << @current_user

    respond_to do |format|
      if @group.save
        @membership = Membership.find_by group: @group, user: @current_user
        @membership.owner = true
        @membership.save

        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @membership = Membership.find_by user: @current_user, group: @group
    respond_to do |format|
      if @membership.owner
        @group.destroy
        format.json { render json: "Group destroyed." }
      else
        format.json { render json: "Cannot destroy group; not owner." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :created, :last_activity)
    end
end
