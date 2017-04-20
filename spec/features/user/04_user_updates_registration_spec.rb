require 'rails_helper'

feature "user updates registration" do
  pending "visit profile page and go to edit page and change email" do
    akalife = User.create!(username: 'kalife_tha_G', email: 'kalife@gmail.com', password: 'very_generic')

    visit user_profile_page

    click_button 'Edit'

    expect(page).to have_content "Edit"

    fill_in 'Email', with: 'mynewemail@gmail.com'

    click_button 'Submit Change'

    expect(page).to have_content "Your email address has been changed to: mynewemail@gmail.com"
    expect(akalife.email).to have content "mynewemail@gmail.com"
  end
  pending "visit profile page and go to edit page and change username" do
    akalife = User.create!(username: 'kalife_tha_G', email: 'kalife@gmail.com', password: 'very_generic')

    visit user_profile_page

    click_button 'Edit'

    expect(page).to have_content "Edit"

    fill_in 'Username', with: 'unstoppable_melee'

    click_button 'Submit Change'

    expect(page).to have_content "Your username has been changed to: unstoppable_melee"
    expect(akalife.username).to have content "unstoppable_melee"
  end
  pending "visit profile page and go to edit page and change password" do
    akalife = User.create!(username: 'kalife_tha_G', email: 'kalife@gmail.com', password: 'very_generic')

    visit user_profile_page

    click_button 'Edit'

    expect(page).to have_content "Edit"

    fill_in 'Password', with: 'utmost_secrecy'

    click_button 'Submit Change'

    expect(page).to have_content "Your password has been changed to: utmost_secrecy"
    expect(akalife.password).to have content "utmost_secrecy"
  end
  pending "visit profile page and go to edit page and change password" do
    akalife = User.create!(username: 'kalife_tha_G', email: 'kalife@gmail.com', password: 'very_generic')

    visit user_profile_page

    click_button 'Edit'

    expect(page).to have_content "Edit"

    fill_in 'Password', with: 'utmost_secrecy'
    fill_in 'Email', with: 'mynewemail@gmail.com'
    fill_in 'Username', with: 'unstoppable_melee'

    click_button 'Submit Change'

    expect(page).to have_content "Your password has been changed to: utmost_secrecy"
    expect(akalife.password).to have content "utmost_secrecy"
    expect(page).to have_content "Your email has been changed to: mynewemail@gmail.com"
    expect(akalife.email).to have content "mynewemail@gmail.com"
    expect(page).to have_content "Your username has been changed to: unstoppable_melee"
    expect(akalife.username).to have content "unstoppable_melee"
  end
end
