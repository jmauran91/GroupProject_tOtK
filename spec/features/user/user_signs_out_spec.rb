require 'rails_helper'

# As an authenticated user
# I want to sign out
# So that no one else can post items or reviews on my behalf

feature 'user signs out' do
  # ACCEPTANCE CRITERIA
  # No matter what page I'm on, I need a link to sign out
  # When I've clicked 'Sign Out' I receive a message that I've signed out
  # Once I've signed out I can't perform authenticated user tasks

  scenario 'user clicks sign out' do
    User.create(username: "tester", email: "email@address.com", password: "password")
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'email@address.com'
    fill_in "user_password", with: 'password'
    click_button "Log in"

    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully."
    expect(page).to have_content "Sign In"
    expect(page).to_not have_content "Sign Out"
  end

end
