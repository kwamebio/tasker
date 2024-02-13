class ApiController < ActionController::API
  include Authenticable
  before_action :set_default_format
  before_action :authorize

  private

  def authorize
    @current_user = current_user

    render json: { errors: [ "Not authorized"] }, status: :unauthorized unless @current_user
  end

  def set_default_format
    request.format = :json
  end
end
