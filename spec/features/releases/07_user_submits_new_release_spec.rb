require 'rails_helper'

feature "user submits a new release" do
  scenario "visit the new release form page and adds a new release" do
    user = User.create!(username:'jbone91', email:'johnmauran1@gmail.com', password: 'noneofyourbusiness')
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'johnmauran1@gmail.com'
    fill_in "Password", with: 'noneofyourbusiness'
    click_button "Log in"

    visit new_release_path
    expect(page).to have_content "New Release Form"


    fill_in 'Title', with: 'Symphony no. 6'
    fill_in 'Artist', with: 'Beethoven'
    fill_in 'Year', with: 1900
    fill_in 'Studio', with: 'morrison'
    fill_in 'No of tracks', with: '3'
    fill_in 'Album art url', with: 'geocities.com/beethoven_fanpage/beethoven_the_man.jpg'

    click_button 'Add Release'

    expect(page).to have_content "Beethoven"
    expect(page).to have_content "Symphony no. 6"
  end
end
