require 'rails_helper'

feature 'Admin can update/delete user posts and accounts' do
    let!(:user) { FactoryGirl.create(
      :user,
      username: 'test_user_1',
      email: 'email1@gmail.com',
      password: 'password1',
      id: 1
      )
    }
    let!(:user_2) { FactoryGirl.create(:user,
      email: 'email2@gmail.com',
      password: 'password2',
      role: 'admin',
      id: 2
      )
    }
    let!(:release) { FactoryGirl.create(:release, user_id: 1) }
    let!(:review) { FactoryGirl.create(:review, release_id: 1, user_id: 1) }

    before :each do
      visit root_path

      click_link "Sign In"
      fill_in "Email", with: 'email2@gmail.com'
      fill_in "Password", with: 'password2'
      click_button "Log in"
    end



  scenario 'Admin deletes a release' do

    visit release_path(release)

    click_link 'Edit'

    click_link 'Delete'

    expect(page).to have_content 'Release successfully deleted'

    expect(page).to_not have_content 'Symphony no. 6'
  end

  scenario 'Admin deletes a user' do

    click_link 'Admin'
    expect(page).to have_content 'test_user_1'

    click_link 'Delete User'

    expect(page).to_not have_content 'test_user_1'

    visit root_path

    expect(User.find_by(username: "test_user_1")).to be nil
  end
end
