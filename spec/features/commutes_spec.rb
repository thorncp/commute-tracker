require "rails_helper"

RSpec.describe "Commutes" do
  # TODO: require login with a controller spec

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
end
