class CommutePresenter
  include ActionView::Helpers::DateHelper

  def initialize(commute)
    @commute = commute
  end

  def day
    commute.departed_at.strftime("%A")
  end

  def duration
    if commute.arrived_at.present?
      distance_of_time_in_words(commute.departed_at, commute.arrived_at)
    else
      "in progress"
    end
  end

  private

  attr_reader :commute
end
