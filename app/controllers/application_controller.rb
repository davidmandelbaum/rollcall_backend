include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  private

  def restrict_access
    if params[:auth_key].blank?
      render json: {message: 'No auth key sent'}, status: 401
    else
    unless restrict_access_by_params || restrict_access_by_header
      render json: {message: 'Invalid Auth Key'}, status: 401
      return
    end
    end
    @current_user = @auth_key.user if @auth_key
  end

  def restrict_access_by_header
    return true if @auth_key

    authenticate_with_http_token do |token|
      @auth_key = AuthKey.find_by auth_key: token
      if @auth_key.updated_at < 10.days.ago
        @auth_key = nil
      end
    end
  end

  def restrict_access_by_params
    return true if @auth_key

    @auth_key = AuthKey.find_by auth_key: params[:auth_key]
    if @auth_key.updated_at < 10.days.ago
      @auth_key = nil
    end
  end
end
