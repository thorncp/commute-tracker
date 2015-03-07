module SpecAuthenticationHelper
  def token_header
    { "HTTP_AUTHORIZATION" => "Token #{ENV['AUTH_TOKEN']}" }
  end
end
