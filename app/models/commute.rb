class Commute < ActiveRecord::Base
  belongs_to :user

  validates :departed_at, presence: true

  def self.by_departed_at
    order(departed_at: :desc)
  end

  def self.in_progress
    where(arrived_at: nil)
  end
end
