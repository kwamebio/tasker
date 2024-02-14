class ApiController < ActionController::API
  include AdminAuthenticable
  include UserAuthenticable

  before_action :set_default_format
  before_action :authorize_admin
  before_action :authorize_user

  private

  def authorize_admin
    @current_admin = current_admin

    render json: { errors: [ "Not authorized"] }, status: :unauthorized unless @current_admin
  end

  def authorize_user
    @current_user = current_user

    render json: { errors: [ "Not authorized"] }, status: :unauthorized unless @current_user
  end

  def set_default_format
    request.format = :json
  end
end
