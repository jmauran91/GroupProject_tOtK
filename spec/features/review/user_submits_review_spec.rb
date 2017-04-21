require 'rails_helper'

# As an unauthenticated user
# I want to sign in
# So that I can post items and review them
feature "user submits review" do
  # ACCEPTANCE CRITERIA
  # When I visit the page I want to a link that allows me to sign in
  # When I valid email and password, I should see a message that I've
  # successfully signed in
  # When I enter invalid information I should receive an error message and not
  # be signed in
  # When I've signed in I should be able to access authenticated user actions
  scenario "submits a new review and sees it" do
    danger = User.create(username: "Johnboy91", email: "Highflyer87@gmail.com", password: "most_generic_pword")
    akalife = Release.create!(title: 'Symphony no. 6', artist: 'Beethoven', year: 1900, studio: 'morrison', no_of_tracks: 3, album_art_url: 'http://www.beethovenphoto.com', user: danger)

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'Highflyer87@gmail.com'
    fill_in "Password", with: 'most_generic_pword'
    click_button "Log in"

    visit new_release_review_path(akalife)

    fill_in "Rating", with: 91
    fill_in "Body", with: 'I loved this'

    click_button "Add"

    expect(page).to have_content 'I loved this'

  end
end
