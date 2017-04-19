require 'rails_helper'

# As a prospective user
# I want to create an account
# So that I can post items and review them
feature 'user signs up' do
  scenario 'user provides valid information in the sign-up form' do
    visit root_path
    expect(page).to have_content "Sign Up"

    click_link "Sign Up"
    fill_in "Username", with: 'flapjack1'
    fill_in "Email", with: 'name@email.com'
    fill_in "user_password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Sign Up"
  end

  scenario 'user provides no information in sign-up form' do
    visit root_path

    click_link "Sign Up"
    click_button "Sign up"

    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Sign Up"
  end
end
#I should see a link on the page to sign-up
#if I fill out all of the required fields with valid information I should become an authenticated user
#valid information includes first name, last name, email address, password, and confirmed password
#if I provide invalid information I will receive error messages regarding why my form failed and it should retain my information
