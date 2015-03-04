require "rails_helper"

RSpec.describe "heartbeat" do
  it "doesn't require auth token" do
    get heartbeat_path

    expect(response.status).to eq(200)
  end
end
