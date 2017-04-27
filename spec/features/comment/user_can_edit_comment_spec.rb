require 'rails_helper'

feature "user can edit a comment" do
  scenario "user edits a comment that they posted" do
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

    expect(page).to have_content "Edit/Delete Comment"

    click_link "Edit/Delete Comment"

    fill_in "Your Comment", with: "This review is a little short.
    Even my comment is longer than this"

    click_button "Update Comment"

    expect(page).to have_content "This review is a little short.
    Even my comment is longer than this"
  end

  scenario 'user attempts to edit a comment they did not post' do
    danger = User.create(
      username: "Johnboy91",
      email: "Highflyer87@gmail.com",
      password: "most_generic_pword"
    )
    draymond = User.create!(
      username: 'donnyray',
      email: 'draymond@gmail.com',
      password: 'password'
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

    comment = Comment.create!(
      body: "This review is too short",
      review: review,
      user: draymond
    )

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: "Highflyer87@gmail.com"
    fill_in "Password", with: "most_generic_pword"
    click_button "Log in"

    visit new_release_review_path(akalife)

    expect(page).to_not have_content "Edit/Delete Comment"
  end
end
