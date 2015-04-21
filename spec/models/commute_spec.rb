require "rails_helper"

RSpec.describe Commute do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:departed_at) }
  end

  describe ".by_departed_at" do
    it "orders commutes by departed_at" do
      second = create(:commute, :completed, departed_at: 1.day.ago)
      first = create(:commute, :completed, departed_at: 1.hour.ago)

      commutes = Commute.by_departed_at

      expect(commutes[0]).to eq(first)
      expect(commutes[1]).to eq(second)
    end
  end

  describe ".in_progress" do
    it "retunrs commutes not completed" do
      first = create(:commute)
      create(:commute, :completed)

      commutes = Commute.in_progress

      expect(commutes).to match_array [first]
    end
  end
end
