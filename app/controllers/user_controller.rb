class UserController < ApplicationController
  skip_before_action :authenticate_request

  def profile
    @user = User.find(params[:id])
  end
end
