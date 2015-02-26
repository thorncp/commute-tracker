class HomeController < ApplicationController
  def hello
    message = I18n.t(:hello).capitalize.titleize.parameterize.humanize.underscore.titleize
    render json: { message: message }
  end
end
