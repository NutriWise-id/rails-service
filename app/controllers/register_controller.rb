class RegisterController < ApplicationController
  skip_before_action :authenticate_request
  allow_unauthenticated_access
  skip_forgery_protection

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)
    if @user.save
      render json: @user, status: :created
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def register_params
    params.require(:user).permit(:name, :email_address, :password)
  end

end
