RSpec.shared_examples "an authenticated endpoint" do
  context "with invalid token" do
    it "returns 401" do
      send(http_method, uri, nil, "HTTP_AUTHORIZATION" => "Token nope-token")

      expect(response.status).to eq(401)
    end
  end

  context "with missing token" do
    it "returns 401" do
      send(http_method, uri, nil, {})

      expect(response.status).to eq(401)
    end
  end
end
