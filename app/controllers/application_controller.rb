class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |request_token, _options|
      request_token.size == auth_token.size &&
        ActiveSupport::SecurityUtils.secure_compare(request_token, auth_token)
    end
  end

  def auth_token
    Rails.configuration.auth_token
  end
end
