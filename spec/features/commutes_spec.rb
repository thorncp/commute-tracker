require "rails_helper"

RSpec.describe "Commutes" do
  it "can be started" do
    user = create(:user)

    visit root_path(as: user)
    click_button "Depart"

    expect(page).to have_content "in progress"
  end

  it "can be stopped" do
    user = create(:user)
    create(:commute)

    visit root_path(as: user)
    click_button "Arrive"

    expect(page).not_to have_content "in progress"
  end

  it "lists the last five commute times" do
    1.upto(5) do |num|
      create(:commute, :completed, departed_at: num.days.ago)
    end

    visit root_path(as: create(:user))

    expect(page).to have_selector(".commute", count: 5)
  end
end
