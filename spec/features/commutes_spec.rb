require "rails_helper"

RSpec.describe "Commutes" do
  it "can be started" do
    user = create(:user)

    visit root_path(as: user)
    click_button "Depart"

    expect(page).to have_content "in progress"
  end

  it "can be stopped" do
    commute = create(:commute)

    visit root_path(as: commute.user)
    click_button "Arrive"

    expect(page).not_to have_content "in progress"
  end

  it "lists the last five commute times" do
    user = create(:user)
    create_list(:commute, 7, :completed, user: user)

    visit root_path(as: user)

    expect(page).to have_selector(".commute", count: 5)
  end

  it "can be deleted" do
    user = create(:user)
    commute = create(:commute, user: user)

    visit root_path(as: user)

    within "#commute_#{commute.id}" do
      expect(page).to have_selector "a.delete[data-method='delete']"
    end
  end
end
