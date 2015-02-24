require "rails_helper"

RSpec.describe "hello world" do
  it "is alive" do
    get hello_path

    expect(JSON.parse(response.body)["message"]).to eq("Hello, World!")
  end
end
