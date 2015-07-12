require "rails_helper"

RSpec.describe "Daily averages" do
  context "user is signed in" do
    it "appears on the root page" do
      user = create(:user)
      create_commute_week(user)

      visit root_path(as: user)

      all(".daily tr").each_with_index do |row, index|
        expect(row).to have_content commute_days[index]
        expect(row).to have_content "30 minutes"
      end
    end
  end

  def commute_days
    %w{Monday Tuesday Wednesday Thursday Friday}
  end

  def create_commute_week(user)
    commute_days.each do |day|
      create(:commute, :completed, user: user, departed_at: Chronic.parse(day))
    end
  end
end
