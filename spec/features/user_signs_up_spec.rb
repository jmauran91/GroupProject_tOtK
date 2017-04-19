require 'rails_helper'

# As a prospective user
# I want to create an account
# So that I can post items and review them

feature 'user signs up' do
  # ACCEPTANCE CRITERIA
  # I should see a link on the page to sign-up
  # If I fill out all of the required fields with valid information I should
  # become an authenticated user
  # Valid information includes username, email address, password, and confirmed
  # password
  # If I provide invalid information I will receive error messages regarding
  # why my form failed and it should retain my information

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

  scenario 'user provides invalid username, email, and password' do
    visit root_path

    click_link "Sign Up"
    fill_in "Username", with: 'ad'
    fill_in "Email", with: 'invalid.com'
    fill_in "user_password", with: 'notqu'
    fill_in "Password confirmation", with: 'notqu'
    click_button "Sign up"

    expect(page).to have_content "Invalid username"
    expect(page).to have_content "Email is invalid"
    expect(page).to have_content "Password is too short"
    expect(page).to have_content "Sign Up"
  end

  scenario "user's confirmation password different from password" do
    visit root_path

    click_link "Sign Up"
    fill_in "Username", with: 'flapjack1'
    fill_in "Email", with: 'name@email.com'
    fill_in "user_password", with: 'password'
    fill_in "Password confirmation", with: 'anotherpassword'
    click_button "Sign up"

    expect(page).to have_content "Password confirmation doesn't match"
    expect(find_field('Username').value).to eq('flapjack1')
    expect(page).to have_content "Sign Up"
  end
end
