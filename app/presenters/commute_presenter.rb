class CommutePresenter
  include ActionView::Helpers::TextHelper

  delegate :model_name, :to_key, :to_model, to: :commute

  def initialize(commute)
    @commute = commute
  end

  def day
    commute.departed_at.strftime("%A")
  end

  def departed_at
    commute.departed_at.iso8601
  end

  def duration
    if commute.arrived_at.present?
      pluralize(duration_minutes, "minute")
    else
      "in progress"
    end
  end

  private

  attr_reader :commute

  def duration_minutes
    ((commute.arrived_at - commute.departed_at) / 1.minute).to_i
  end
end
