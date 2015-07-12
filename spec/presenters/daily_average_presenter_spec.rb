require "rails_helper"

RSpec.describe DailyAveragePresenter do
  describe "#day" do
    it "returns the day name of the day of the week" do
      daily_average = double("DailyAverage", day_of_week: 1)

      presenter = DailyAveragePresenter.new(daily_average)

      expect(presenter.day).to eq "Monday"
    end
  end

  describe "#duration" do
    it "returns the rounded duration in minutes" do
      daily_average = double("DailyAverage", duration: 30.74)

      presenter = DailyAveragePresenter.new(daily_average)

      expect(presenter.duration).to eq "31 minutes"
    end
  end
end
