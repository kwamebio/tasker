class Api::V1::AdminsController < ApiController
  skip_before_action :authorize_admin , only: [:create]
  skip_before_action :authorize_user

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      render json: AdminSerializer.new(@admin).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @admin.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      render json: AdminSerializer.new(@admin).serializable_hash[:data][:attributes]
    else
      render json: { errors: @admin.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    head :no_content
  end

  private

  def admin_params
    params.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
  end
end
