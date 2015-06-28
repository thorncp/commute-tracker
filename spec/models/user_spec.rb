require "rails_helper"

RSpec.describe User do
  describe "Associations" do
    it { should have_many(:commutes).dependent(:destroy) }
    it { should have_many(:daily_averages) }
  end

  describe "validations" do
    it { should validate_presence_of(:timezone) }
    it do
      should validate_inclusion_of(:timezone).in_array(
        TZInfo::Timezone.all_identifiers
      )
    end
  end
end
