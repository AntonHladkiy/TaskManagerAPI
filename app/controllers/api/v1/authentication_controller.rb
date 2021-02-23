class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    user = User.find_by(email: params[:email])
     if !user.confirmed_at.nil?
      if user&.valid_password?(params[:password])
        render json: { token: JsonWebToken.encode(sub: user.id) }
      else
        render json: { errors: 'invalid' }
      end
    else
        render json: { errors: 'unconfirmed' }
    end
  end
  def fetch
    render json: current_user
  end
end
