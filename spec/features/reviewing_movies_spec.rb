require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature "Review movies" do

  background do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.create(:movie)
    login_as(user, :scope => :user)
  end

  scenario "Create a review" do
    visit root_path
    click_link "Harassment Park"
    fill_in "Body", with: "A terrific movie!"
    click_button "Review"
    expect(page).to have_content("@gmail.com")
    expect(page).to have_content("A terrific movie!")
  end

  scenario "Create a review when not logged in" do
    logout(:user)
    visit root_path
    click_link "Harassment Park"
    fill_in "Body", with: "A terrific movie!"
    click_button "Review"
    expect(page).to have_content("Sign in")
  end

  scenario "Edit review" do
    visit root_path
    click_link "Harassment Park"
    fill_in "Body", with: "A terrific movie!"
    click_button "Review"
    expect(page).to have_content("Edit Review")
    click_link "Edit Review"
    fill_in "Body", with: "Not so good."
    expect(page).to have_content("Not so good")
    expect(page).to_not have_content("A terrific movie!")
  end

  scenario "Edit a review only appears if it belongs to you" do
    visit root_path
    click_link "Harassment Park"
    fill_in "Body", with: "A terrific movie!"
    click_button "Review"
    logout(:user)
    visit root_path
    click_link "Harassment Park"
    expect(page).to_not have_content("Edit Review")
  end

  scenario "Delete review" do
    visit root_path
    click_link "Harassment Park"
    fill_in "Body", with: "A terrific movie!"
    click_button "Review"
    expect(page).to have_content("Delete Review")
    click_link "Delete Review"
    expect(page).to have_content("Review deleted")
    expect(page).to_not have_content("A terrific movie!")
  end

  scenario "Delete review link only appears if the review belongs to you" do
    visit root_path
    click_link "Harassment Park"
    fill_in "Body", with: "A terrific movie!"
    click_button "Review"
    logout(:user)
    visit root_path
    click_link "Harassment Park"
    expect(page).to_not have_content("Delete Review")
  end
end
