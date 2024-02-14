class Api::V1::Auth::UserSessionsController < ApiController
    skip_before_action :authorize, only: [:create]

    def create
      user = User.find_by(email: user_params[:email])

      if user && user.authenticate(user_params[:password])
        render json: { token: user.token }, status: :ok
      else
        render json: { errors: ['Invalid Email/Password'] }, status: :unauthorized
      end
    end


    # def destroy
    #   current_user.update(auth_token: nil)
    #   head :no_content
    # end

    private

    def user_params
      params.permit(:email, :password)
    end
end
