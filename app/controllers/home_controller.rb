class HomeController < ApplicationController
  def index
    @latest_commutes = latest_commutes
    @in_progress_commute = Commute.in_progress.first
  end

  def depart
    Commute.create!(departed_at: Time.zone.now)
    redirect_to root_path
  end

  def arrive
    Commute.in_progress.first.update_attributes(arrived_at: Time.zone.now)
    redirect_to root_path
  end

  private

  def latest_commutes
    Commute.by_departed_at.limit(5).map do |commute|
      CommutePresenter.new(commute)
    end
  end
end
