require 'rails_helper'

feature "user can submit reviews" do
  scenario "user visits the release page and submits a review and sees it" do
    danger = User.create!(username: 'jbone91', email: 'johnmauran1@gmail.com', password: 'noneofyourbusiness')

    visit new_user_session_path
    fill_in 'Email', with: 'johnmauran1@gmail.com'
    fill_in 'Password', with: 'noneofyourbusiness'
    click_button 'Log in'

    new_release = Release.create!(title: 'Album', artist: 'Artist', year: 1987, studio: 'Mororsion', no_of_tracks: 9, album_art_url: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg', user: danger)
    new_review = Review.create!(rating: 91, body: 'lsjdfoiwennwef', votes: 1, user: danger, release: new_release)

    visit new_user_session_path
    fill_in 'Email', with: 'johnmauran1@gmail.com'
    fill_in 'Password', with: 'noneofyourbusiness'
    click_button 'Log in'

    visit release_path(new_release)

    click_button 'Upvote'
    expect(page).to have_content "Votes: 2"

    click_button 'Downvote'
    click_button 'Downvote'
    expect(page).to have_content "Votes: 0"

  end
end
