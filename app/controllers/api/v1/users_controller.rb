class Api::V1::UsersController < ApiController

  skip_before_action :authorize, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :id)
  end

end
