require 'rails_helper'

feature "user submits a new release" do
  scenario "user visits the new release form page and submits a release" do
    User.create!(username: 'jbone91', email: 'johnmauran1@gmail.com', password: 'noneofyourbusiness')
    visit new_user_session_path
    fill_in 'Email', with: 'johnmauran1@gmail.com'
    fill_in 'Password', with: 'noneofyourbusiness'
    click_button 'Log in'

    visit new_release_path
    expect(page).to have_content "New Release Form"

    fill_in 'Title', with: 'Great Album'
    fill_in 'Artist', with: 'Great Band'
    fill_in 'Performer', with: 'Great Hands'
    fill_in 'Year', with: 1979
    fill_in 'Studio', with: 'Great Studio'
    fill_in 'No of tracks', with: 9
    fill_in 'Album art url', with: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg'

    click_button 'Add Release'

    expect(page).to have_content 'Great Album'
  end
end
