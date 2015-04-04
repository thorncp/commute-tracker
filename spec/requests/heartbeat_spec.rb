require "rails_helper"

RSpec.describe "heartbeat" do
  it "returns 200" do
    get heartbeat_path

    expect(response.status).to eq(200)
  end
end
