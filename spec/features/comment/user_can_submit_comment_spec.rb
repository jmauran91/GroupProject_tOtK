require 'rails_helper'

feature "user submits comment" do
  scenario "user submits a comment and sees it" do
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

    click_link "Add Comment"

    fill_in "Body", with: "This review is a little short. Could use lengthening."
    click_button "Add"

    expect(page).to have_content "lengthening"
  end
  scenario "unauthenticated user can't add comment" do
    danger = User.create(username: "Johnboy91", email: "Highflyer87@gmail.com", password: "most_generic_pword")
    akalife = Release.create!(title: 'Symphony no. 6', artist: 'Beethoven', year: 1900, studio: 'morrison', no_of_tracks: 3, album_art_url: 'http://www.beethovenphoto.com', user: danger)
    Review.create!(rating: 67, body: 'honestly subpar', user: danger, release: akalife)


    visit release_path(akalife)

    click_link "Add Comment"

    fill_in "Body", with: 'somthing obnoxious'

    click_button 'Add'

    expect(page).to have_content "You must be logged in to do that"
  end
end
