require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature "Page surfing" do

  background do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.create(:movie)
    login_as(user, :scope => :user)
  end

  scenario "Signed in with a user role" do
    visit root_path
    expect(page).to have_content("Harassment Park")
  end

  scenario "Click movie title on a movie" do
    visit root_path
    click_link "Harassment Park"
    expect(page).to have_css("h1")
    expect(page).to have_content("Now Playing: Harassment Park")
    expect(page).to have_css("p.description")
    expect(page).to have_content("A devestating tale dinos and assault.")
    expect(page).to have_content("Reviews")
  end

  scenario "Create a new movie" do
    visit root_path
    click_link "Add Moviefilm"
    expect(page).to have_content("Add a Movie")
    fill_in "Title", with: "Ferris Bueller's Day On"
    fill_in "Description", with: "Ferris becomes a Jedi."
    click_button "Create Movie"
    expect(page).to have_content("Movie added")
  end

  scenario "Creating a movie already in the system" do
    visit root_path
    click_link "Add Moviefilm"
    expect(page).to have_content("Add a Movie")
    fill_in "Title", with: "Harassment Park"
    fill_in "Description", with: "A devestating tale dinos and assault."
    click_button "Create Movie"
    expect(page).to have_content("There was an error creating your movie")
  end

  scenario "Editing a movie" do
    visit root_path
    click_link "Edit Moviefilm"
    fill_in "Title", with: "Harassment Park"
    fill_in "Description", with: "DINOS!"
    click_button "Update Movie"
    expect(page).to have_content("DINOS!")
  end

  scenario "Deleting a movie" do
    visit root_path
    click_link "Delete Moviefilm"
    expect(page).to have_content("Moviefilm deleted")
    expect(page).to_not have_content("Harassment Park")
  end
end
