require 'rails_helper'

feature 'user can update their review' do
  scenario 'User edits a review that they posted' do
    danger = User.create(
      username: "Johnboy91",
      email: "Highflyer87@gmail.com",
      password: "most_generic_pword"
    )
    akalife = Release.create!(
      title: 'Symphony no. 6',
      artist: 'Beethoven', performer: "",
      year: 1900,
      studio: 'morrison',
      no_of_tracks: 3,
      album_art_url: 'http://www.beethovenphoto.com',
      description: "",
      user: danger
    )

    review = Review.create!(
      body: 'I loved this',
      rating: 100,
      release: akalife,
      user: danger
    )

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: "Highflyer87@gmail.com"
    fill_in "Password", with: "most_generic_pword"
    click_button "Log in"

    visit release_path(akalife)

    expect(page).to have_content "Edit/Delete this Review"

    click_link "Edit/Delete this Review"

    fill_in "Body", with: "I loved this, it sounds amazing"

    click_button "Update Review"

    expect(page).to have_content "it sounds amazing"
  end
end
