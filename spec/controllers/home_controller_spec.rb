require "rails_helper"

RSpec.describe HomeController do
  describe "#index" do
    context "when user is not signed in" do
      it "redirects to sign in" do
        get :index

        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
