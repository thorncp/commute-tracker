class DailyAverage < ActiveRecord::Base
  belongs_to :user

  after_initialize :readonly!

  def self.by_day
    order(:day_of_week)
  end
end
