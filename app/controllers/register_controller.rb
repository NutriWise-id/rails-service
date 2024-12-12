class RegisterController < ApplicationController
  skip_before_action :authenticate_request
  allow_unauthenticated_access
  skip_forgery_protection

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)

    Rails.logger.info("Request format: #{request.format}")

    if @user.save
      respond_to do |format|
        format.json { render json: { "Success": true, "Message": "Account created!" }, status: :created }
        format.html { redirect_to new_session_path }
      end
    else
      respond_to do |format|
        format.json { render json: { "Success": false, "Message": "This account is not available!" }, status: :conflict }
        format.html { render "new", status: :unprocessable_entity }
      end
    end
  end

  private

  def register_params
    params.permit(:name, :email_address, :password)
  end
end
