# require 'rails_helper'

# As an authenticated user
# I want to update my information
# So that I can keep my profile up to date

feature "user updates registration" do
  # ACCEPTANCE CRITERIA
  # I should be able to edit my information from my profile with an edit button
  # I should change my email, username, and password
  # If I enter any invalid information I will receive errors, and the changes
  # won't be saved
  # If enter valid changes I will receive notification that the changes have
  # been made
  # I should be able to sign in only with the updated information

    before :each do
      User.create!(username: 'kalife_tha_G', email: 'kalife@gmail.com', password: 'very_generic')
      visit root_path

      click_link "Sign In"
      fill_in "Email", with: 'kalife@gmail.com'
      fill_in "Password", with: 'very_generic'
      click_button "Log in"
    end

    scenario "visit profile page and go to edit page and change email. Can sign in with new email" do

      click_link "My Profile"
      click_link "Edit my profile"

      fill_in 'Email', with: 'mynewemail@gmail.com'
      fill_in 'Current password', with: 'very_generic'
      click_button 'Update'
      expect(page).to have_content "Your account has been updated successfully."

      click_link "Sign Out"
      click_link "Sign In"

      fill_in "Email", with: 'mynewemail@gmail.com'
      fill_in "Password", with: 'very_generic'
      click_button "Log in"

      expect(page).to have_content 'Sign Out'
    end

    scenario "visit profile page and go to edit page and change email. Cannot sign in with old email" do

      click_link "My Profile"
      click_link "Edit"

      fill_in 'Email', with: 'mynewemail@gmail.com'
      fill_in 'Current password', with: 'very_generic'
      click_button 'Update'
      expect(page).to have_content "Your account has been updated successfully."

      click_link "Sign Out"
      click_link "Sign In"

      fill_in "Email", with: 'kalife@gmail.com'
      fill_in "Password", with: 'very_generic'
      click_button "Log in"

      expect(page).to have_content 'Invalid Email or password'
    end

    scenario "visit profile page and go to edit page and provide invalid email" do

      click_link "My Profile"
      click_link "Edit"

      fill_in 'Email', with: 'mynewemail.kgmail.com'
      fill_in 'Current password', with: 'very_generic'
      click_button 'Update'
      expect(page).to have_content "Email is invalid"
    end
end
