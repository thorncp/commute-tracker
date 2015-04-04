class HomeController < ApplicationController
  def index
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
end
