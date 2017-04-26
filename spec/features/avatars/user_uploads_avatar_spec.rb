require 'rails_helper'

feature 'user can upload an avatar to their profile' do
  let!(:user) { FactoryGirl.create(:user) }
  scenario 'user uploads avatar' do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'email@gmail.com'
    fill_in "Password", with: 'password'
    click_button "Log in"

    expect(page).to have_content 'Sign Out'
    expect(page).to_not have_content 'Sign In'
  end

  xscenario 'user removes avatar' do

  end
end
