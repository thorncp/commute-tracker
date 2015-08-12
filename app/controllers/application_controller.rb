class ApplicationController < ActionController::Base
  include Clearance::Controller

  around_action :use_current_user_time_zone, if: :signed_in?
  before_action :require_login

  private

  def use_current_user_time_zone
    Time.use_zone(current_user.timezone) do
      yield
    end
  end
end
