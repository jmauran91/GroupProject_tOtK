require 'rails_helper'

# As an unauthenticated user
# I want to sign in
# So that I can post items and review them
feature "user signs in" do
  # ACCEPTANCE CRITERIA
  # When I visit the page I want to a link that allows me to sign in
  # When I valid email and password, I should see a message that I've
  # successfully signed in
  # When I enter invalid information I should receive an error message and not
  # be signed in
  # When I've signed in I should be able to access authenticated user actions
  scenario "clicks sign in and fills in the fields and signs in" do
    User.create(username: "Johnboy91", email: "Highflyer87@gmail.com", password: "most_generic_pword")
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'Highflyer87@gmail.com'
    fill_in "Password", with: 'most_generic_pword'
    click_button "Log in"

    expect(page).to have_content 'Sign Out'
    expect(page).to_not have_content 'Sign In'
  end

  scenario "clicks sign in but fills in invalid information" do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: "bademail@false.com"
    fill_in "Password", with: "badpassword"
    click_button "Log in"

    expect(page).to have_content 'Invalid Email or password'
    expect(page).to have_content 'Sign In'
    expect(page).to_not have_content 'Sign Out'
  end
end
