require 'rails_helper'

feature 'automated emails' do
  scenario 'Release creator is sent an email when a review is posted' do
    user = FactoryGirl.create(
      :user,
      username: 'test_user_1',
      email: 'email1@gmail.com',
      password: 'password1',
      id: 1
      )
    release = FactoryGirl.create(:release, user_id: 1)

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'email1@gmail.com'
    fill_in "Password", with: 'password1'
    click_button "Log in"

    visit new_release_review_path(release)

    fill_in "Rating", with: 91
    fill_in "Body", with: 'I loved this'

    click_button "Add"
    expect(page).to have_content("I loved this")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
