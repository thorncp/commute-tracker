require "rails_helper"

RSpec.describe DailyAverage do
  describe "associations" do
    it { should belong_to :user }
  end

  it { should be_readonly }

  describe "#duration" do
    it "is the average duration in minutes for commutes on a day of week" do
      user = create(:user)
      day_of_week = 1.hour.ago.wday
      _today = create(
        :commute,
        user: user,
        departed_at: 1.hour.ago,
        arrived_at: 30.minutes.ago,
      )
      _yesterday = create(
        :commute,
        user: user,
        departed_at: 1.hour.ago - 1.day,
        arrived_at: 30.minutes.ago - 1.day,
      )
      _last_week = create(
        :commute,
        user: user,
        departed_at: 1.hour.ago - 1.week,
        arrived_at: 15.minutes.ago - 1.week,
      )
      expected_average = (30 + 45) / 2

      daily_average = user.daily_averages.where(day_of_week: day_of_week).first

      expect(daily_average.duration).to be_within(1).of(expected_average)
    end
  end
end
