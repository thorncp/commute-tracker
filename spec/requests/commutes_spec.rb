require "rails_helper"

RSpec.describe "commutes" do
  describe "fetching commutes" do
    context "when commutes exist" do
      it "returns 200" do
        create(:commute)

        get commutes_path

        expect(response.status).to eq(200)
      end

      it "returns the commutes in reverse chronological order" do
        second = create(:commute, :completed, departed_at: 1.day.ago)
        first = create(:commute, :completed, departed_at: 1.hour.ago)

        get commutes_path

        expect(json_response["commutes"][0]["id"]).to eq(first.id)
        expect(json_response["commutes"][1]["id"]).to eq(second.id)
      end
    end

    context "when no commutes exist" do
      it "returns empty collection" do
        get commutes_path

        expect(json_response["commutes"]).to be_empty
      end
    end
  end

  describe "creating commutes" do
    context "with valid data" do
      it "returns the commute" do
        commute_params = { commute: { departed_at: Time.zone.now } }

        post commutes_path, commute_params

        expect(json_response["commute"]["id"]).not_to be_nil
        expect(json_response["commute"]["departed_at"]).not_to be_nil
      end

      it "returns 201" do
        commute_params = { commute: { departed_at: Time.zone.now } }

        post commutes_path, commute_params

        expect(response.status).to eq(201)
      end
    end

    context "with invalid data" do
      it "returns 422" do
        commute_params = { commute: { departed_at: nil } }

        post commutes_path, commute_params

        expect(response.status).to eq(422)
      end

      it "includes the error message" do
        commute_params = { commute: { departed_at: nil } }

        post commutes_path, commute_params

        expect(json_response["errors"].first).to include("can't be blank")
      end
    end
  end

  describe "updating commutes" do
    let(:commute) { create(:commute) }

    context "with valid data" do
      it "returns 200" do
        update_params = {
          commute: { arrived_at: Time.zone.now }
        }

        patch commute_path(commute), update_params

        expect(response.status).to eq(200)
      end

      it "returns the updated commute" do
        arrived_at = Time.zone.now
        update_params = {
          commute: { arrived_at: arrived_at }
        }

        patch commute_path(commute), update_params
        expect(json_response["commute"]["id"]).not_to be_nil
        expect(json_response["commute"]["departed_at"]).not_to be_nil
        expect(json_response["commute"]["arrived_at"]).not_to be_nil
      end
    end

    context "with invalid data" do
      it "returns 422" do
        update_params = { commute: { departed_at: nil } }

        patch commute_path(commute), update_params

        expect(response.status).to eq(422)
      end

      it "includes the error message" do
        update_params = { commute: { departed_at: nil } }

        patch commute_path(commute), update_params

        expect(json_response["errors"].first).to include("can't be blank")
      end
    end
  end
end
