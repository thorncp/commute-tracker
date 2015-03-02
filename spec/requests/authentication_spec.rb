require "rails_helper"

RSpec.describe "authentication" do
  context "with valid token" do
    it "executes the action" do
      get hello_path, nil, "HTTP_AUTHORIZATION" => "Token #{ENV['AUTH_TOKEN']}"

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["message"]).to eq("Hello, World!")
    end
  end

  context "with invalid token" do
    it "returns error message" do
      get hello_path, nil, "HTTP_AUTHORIZATION" => "Token invalid-token"

      expect(response.status).to eq(401)
      expect(JSON.parse(response.body)["error"]).to eq("Unauthorized")
    end
  end

  context "with missing token" do
    it "returns error message" do
      get hello_path

      expect(response.status).to eq(401)
      expect(JSON.parse(response.body)["error"]).to eq("Unauthorized")
    end
  end
end
