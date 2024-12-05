class RegisterController < ApplicationController
  skip_before_action :authenticate_request
  allow_unauthenticated_access
  skip_forgery_protection

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)

    # Log the request format to check what's being sent
    Rails.logger.info("Request format: #{request.format}")

    if @user.save
      respond_to do |format|
        format.json { render json: @user, status: :created }
        format.html { redirect_to new_session_path }
      end
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def register_params
    params.require(:user).permit(:name, :email_address, :password)
  end
end
