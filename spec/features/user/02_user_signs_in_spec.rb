require 'rails_helper'

feature "user signs in" do
  scenario "clicks sign in and fills in the fields and signs in" do

    visit new_user_session_path

    fill_in "Username", with: "Johnboy91"
    fill_in "Email", with: "Highflyer87@gmail.com"
    fill_in "Password", with: "most_generic_pword"

    click_button "Sign In"

    expect(page).to have_content 'Sign Out'

  end
end
