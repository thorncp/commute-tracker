require "rails_helper"

RSpec.describe CommutesController do
  describe "#destroy" do
    it "destroys the commute" do
      user = create(:user)
      commute = create(:commute, user: user)
      sign_in_as user

      delete :destroy, id: commute.id

      expect(Commute.count).to eq 0
    end

    it "redirects to the root path" do
      user = create(:user)
      commute = create(:commute, user: user)
      sign_in_as user

      delete :destroy, id: commute.id

      expect(controller).to redirect_to root_path
    end
  end
end
