class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    unless check_token
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def check_token
    authenticate_with_http_token do |token, _options|
      token == ENV["AUTH_TOKEN"]
    end
  end
end
