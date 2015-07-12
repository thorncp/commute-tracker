class DailyAveragePresenter
  delegate :model_name, :to_key, :to_model, to: :daily_average

  def initialize(daily_average)
    @daily_average = daily_average
  end

  def day
    Date::DAYNAMES[@daily_average.day_of_week]
  end

  def duration
    "#{rounded_duration} minutes"
  end

  private

  def rounded_duration
    @daily_average.duration.round(0)
  end

  attr_reader :daily_average
end
