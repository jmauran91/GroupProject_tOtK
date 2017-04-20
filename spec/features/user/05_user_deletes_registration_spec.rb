require 'rails_helper'

feature "user updates registration" do
  pending "visit profile page and go to edit page and change email" do
    akalife = User.create!(username: 'kalife_tha_G', email: 'kalife@gmail.com', password: 'very_generic')

    visit user_profile_page

    click_button 'Delete'
    expect(page).to have_content "Are you sure?"
    click_button 'Yes'

    expect(page).to have_content "Your account has been deleted succesfully"
    expect(akalife).to_not exist

  end
end
