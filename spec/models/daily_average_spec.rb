require "rails_helper"

RSpec.describe DailyAverage do
  describe "associations" do
    it { should belong_to :user }
  end

  it { should be_readonly }

  it "does not include incomplete commutes" do
    create(:commute, arrived_at: nil)

    expect(DailyAverage.all).to be_empty
  end

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

  describe ".by_day" do
    it "orders the stats by day of week" do
      create(:commute, :completed, departed_at: Chronic.parse("wednesday"))
      create(:commute, :completed, departed_at: Chronic.parse("tuesday"))
      create(:commute, :completed, departed_at: Chronic.parse("friday"))
      create(:commute, :completed, departed_at: Chronic.parse("monday"))
      create(:commute, :completed, departed_at: Chronic.parse("thursday"))

      averages = DailyAverage.by_day

      expect(averages[0].day_of_week).to eq 1
      expect(averages[1].day_of_week).to eq 2
      expect(averages[2].day_of_week).to eq 3
      expect(averages[3].day_of_week).to eq 4
      expect(averages[4].day_of_week).to eq 5
    end
  end

  def create_commute_on(day)
    create(:commute, :completed, departed_at: Chronic.parse(day))
  end
end
