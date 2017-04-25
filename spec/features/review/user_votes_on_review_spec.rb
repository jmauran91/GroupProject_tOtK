require 'rails_helper'

feature "user votes on review" do
  scenario "user votes on a review and sees it" do
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

    visit release_path(akalife)

    click_link "Add a Review"
    fill_in "Rating", with: 91
    fill_in "Body", with: 'I loved this'

    click_button "Add"

    click_button 'Upvote'
    expect(page).to have_content "Votes: 1"
    click_button 'Downvote'
    expect(page).to have_content "Votes: 0"
  end
end
