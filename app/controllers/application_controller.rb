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
    authenticate_with_http_token do |request_token, _options|
      request_token.size == auth_token.size &&
        ActiveSupport::SecurityUtils.secure_compare(request_token, auth_token)
    end
  end

  def auth_token
    Rails.configuration.auth_token
  end
end
