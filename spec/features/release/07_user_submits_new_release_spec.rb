require 'rails_helper'

feature "user submits a new release" do
  scenario "user visits the new release form page and submits a release" do
    User.create!(username: 'jbone91', email: 'johnmauran1@gmail.com', password: 'noneofyourbusiness')
    visit new_user_session_path
    fill_in 'Email', with: 'johnmauran1@gmail.com'
    fill_in 'Password', with: 'noneofyourbusiness'
    click_button 'Log in'

    click_link "Add Release"
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

  scenario "user provides invalid information" do
    User.create!(username: 'jbone91', email: 'johnmauran1@gmail.com', password: 'noneofyourbusiness')
    visit new_user_session_path
    fill_in 'Email', with: 'johnmauran1@gmail.com'
    fill_in 'Password', with: 'noneofyourbusiness'
    click_button 'Log in'

    click_link "Add Release"
    click_button 'Add Release'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Artist can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Year is not valid"
    expect(page).to have_content "No of tracks can't be blank"
    expect(page).to have_content "No of tracks is not a number"
    expect(page).to have_content "Album art url is invalid"
  end
end
