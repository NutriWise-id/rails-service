class LandingController < ApplicationController
  skip_before_action :authenticate_request
  allow_unauthenticated_access

  def index

    current_user = ""

    if authenticated?
      current_user = Current.user.email_address
    end

    @user = User.find_by(email_address: current_user)
  end
end
