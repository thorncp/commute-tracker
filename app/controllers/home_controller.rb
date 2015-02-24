class HomeController < ApplicationController
  def hello
    render json: { message: I18n.t(:hello) }
  end
end
