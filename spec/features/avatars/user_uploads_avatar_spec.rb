require 'rails_helper'

feature 'user can upload an avatar to their profile' do

  let!(:user) { FactoryGirl.create(
    :user,
    email: 'email1@gmail.com',
    password: 'password1'
    )
  }
  before :each do

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'email1@gmail.com'
    fill_in "Password", with: 'password1'
    click_button "Log in"

    click_link "My Profile"
    click_link "Edit my profile"

    attach_file :user_avatar,
      "#{Rails.root}/spec/support/images/bass_guitar_hero_by_karate_chop.jpg"
    fill_in "Current password", with: 'password1'

    click_button "Update"

    click_link "My Profile"
  end

    scenario 'user uploads avatar' do

    expect(page).to have_css("img[src*='bass_guitar_hero_by_karate_chop.jpg']")

  end

  scenario 'user removes avatar' do

    click_link "Edit my profile"
    check "Remove avatar"
    fill_in "Current password", with: 'password1'
    click_button "Update"

    click_link "My Profile"
    expect(page).to_not have_css("img[src*='bass_guitar_hero_by_karate_chop.jpg']")
  end
end
