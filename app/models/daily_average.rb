class DailyAverage < ActiveRecord::Base
  belongs_to :user

  after_initialize :readonly!
end
