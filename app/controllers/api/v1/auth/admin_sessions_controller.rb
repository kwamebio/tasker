class Api::V1::Auth::AdminSessionsController < ApiController

  skip_before_action :authorize_admin, only: [:create]
  skip_before_action :authorize_user, only: [:create]

    def create
      admin = Admin.find_by(email: admin_params[:email])

      if admin && admin.authenticate(admin_params[:password])
        render json: { token: admin.token }, status: :ok
      else
        render json: { errors: ['Invalid Email/Password'] }, status: :unauthorized
      end
    end


    private

    def admin_params
      params.permit(:email, :password)
    end
end
