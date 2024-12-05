class ApplicationController < ActionController::Base
  include Authentication
  include JsonWebToken
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    if token.present?
      jwt_decode(token) # Pass the token for decoding
    else
      render json: { error: 'Token is missing' }, status: :unauthorized
    end
  rescue JWT::DecodeError => e
    render json: { error: "Invalid token: #{e.message}" }, status: :unauthorized
  end
end
