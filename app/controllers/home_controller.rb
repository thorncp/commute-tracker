class HomeController < ApplicationController
  def hello
    @message = I18n.t(:hello)
  end
end
