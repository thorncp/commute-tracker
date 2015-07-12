class HomeController < ApplicationController
  def index
    @latest_commutes = latest_commutes
    @in_progress_commute = user_commutes.in_progress.first
    @daily_averages = user_daily_averages
  end

  def depart
    user_commutes.create!(departed_at: Time.zone.now)
    redirect_to root_path
  end

  def arrive
    user_commutes.in_progress.first.update_attributes(
      arrived_at: Time.zone.now
    )
    redirect_to root_path
  end

  private

  def latest_commutes
    user_commutes.by_departed_at.limit(5).map do |commute|
      CommutePresenter.new(commute)
    end
  end

  def user_commutes
    current_user.commutes
  end

  def user_daily_averages
    current_user.daily_averages.by_day.map do |daily_average|
      DailyAveragePresenter.new(daily_average)
    end
  end
end
