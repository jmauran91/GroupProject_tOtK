require 'rails_helper'

feature 'Admin can update/delete user posts and accounts' do
    let(:user) { FactoryGirl.create(:user) }
    let(:user_2) { FactoryGirl.create(:user, role: 'admin') }
    let(:release) { FactoryGirl.create(:release, user_id: 1) }
    let(:review) { FactoryGirl.create(:review, release_id: 1, user_id: 1) }
    let(:comment) { FactoryGirl.create(:comment, review_id: 1, user_id: 1) }

  scenario 'Admin deletes comment' do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'email@gmail.com'
    fill_in "Password", with: 'password'
    click_button "Log in"
    expect(page).to have_content 'Sign Out'

  end



end
