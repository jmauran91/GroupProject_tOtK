require 'rails_helper'

# As a prospective user
# I want to create an account
# So that I can post items and review them
feature 'user signs up' do
  scenario 'user provides valid information in the sign-up form' do
    visit root_path
    expect(page).to have_content "Sign Up"
  end
end
#I should see a link on the page to sign-up
#if I fill out all of the required fields with valid information I should become an authenticated user
#valid information includes first name, last name, email address, password, and confirmed password
#if I provide invalid information I will receive error messages regarding why my form failed and it should retain my information
