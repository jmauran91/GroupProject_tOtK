require 'rails_helper'
feature "user submits review" do
  scenario "submits a new review and sees it" do
    danger = User.create(username: "Johnboy91", email: "Highflyer87@gmail.com",
                password: "most_generic_pword")
    akalife = Release.create!(
      title: 'Symphony no. 6',
      artist: 'Beethoven',
      performer: '',
      year: 1900,
      studio: 'morrison',
      no_of_tracks: 3,
      album_art_url: 'http://www.beethovenphoto.com',
      description: '',
      user: danger
      )

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
    expect(page).to have_content '91'

  end
end
