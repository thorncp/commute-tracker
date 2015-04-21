require "rails_helper"

RSpec.describe User do
  describe "Associations" do
    it { should have_many(:commutes).dependent(:destroy) }
  end
end
