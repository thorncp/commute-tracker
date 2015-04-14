require "rails_helper"

RSpec.describe CommutePresenter do
  describe "#day" do
    it "returns day of the week" do
      commute = double("Commute", departed_at: Time.zone.now.monday)

      presenter = CommutePresenter.new(commute)

      expect(presenter.day).to eq "Monday"
    end
  end

  describe "#duration" do
    context "when arrived_at is present" do
      it "returns English description of the duration" do
        commute = build(
          :commute,
          departed_at: 30.minutes.ago,
          arrived_at: Time.zone.now,
        )

        presenter = CommutePresenter.new(commute)

        expect(presenter.duration).to include "30 minutes"
      end
    end

    context "when arrived_at is nil" do
      it "returns in progress description" do
        commute = build(:commute)

        presenter = CommutePresenter.new(commute)

        expect(presenter.duration).to eq "in progress"
      end
    end
  end
end
