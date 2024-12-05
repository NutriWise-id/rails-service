class LandingController < ApplicationController
  skip_before_action :authenticate_request
  allow_unauthenticated_access

  def index
    payload = { data: 'test' }

    # IMPORTANT: set nil as password parameter
    token = JWT.encode(payload, nil, 'none')

    # eyJhbGciOiJub25lIn0.eyJkYXRhIjoidGVzdCJ9.
    puts token

    # Set password to nil and validation to false otherwise this won't work
    decoded_token = JWT.decode(token, nil, false)

    # Array
    # [
    #   {"data"=>"test"}, # payload
    #   {"alg"=>"none"} # header
    # ]
    puts decoded_token
  end
end
