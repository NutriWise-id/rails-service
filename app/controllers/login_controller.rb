class LoginController < ApplicationController
  skip_before_action :authenticate_request
  allow_unauthenticated_access
  skip_forgery_protection

  def login
    @user = User.find_by_email_address(params[:email_address])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end
end
