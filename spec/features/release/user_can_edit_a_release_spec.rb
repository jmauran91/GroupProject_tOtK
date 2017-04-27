require 'rails_helper'

feature 'User can edit a release' do
  scenario 'User edits a release that they posted' do
  jmauran = User.create!(
    username: 'jmauran91',
    email: 'johnmauran1@gmail.com',
    encrypted_password: 'none_ofyour_business',
    password: 'none_ofyour_business'
  )
  akalife = Release.create!(
    title: 'Symphony no. 6',
    performer: '',
    artist: 'Beethoven',
    year: 1900,
    studio: 'morrison',
    no_of_tracks: 3,
    album_art_url: 'http://www.beethovenphoto.com',
    description: '',
    user: jmauran
  )

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'johnmauran1@gmail.com'
    fill_in "Password", with: 'none_ofyour_business'
    click_button "Log in"

    visit release_path(akalife)

    expect(page).to have_content 'Edit'

    click_link 'Edit'

    fill_in 'Performer', with: 'The Boston Pops'

    click_button 'Update Release'

    expect(page).to have_content 'Release successfully updated'

    expect(page).to have_content 'The Boston Pops'
  end

  scenario 'A user cannot edit a release they did not post' do
    jmauran = User.create!(
      username: 'jmauran91',
      email: 'johnmauran1@gmail.com',
      encrypted_password: 'none_ofyour_business',
      password: 'none_ofyour_business'
    )
    draymond = User.create!(
      username: 'donnyray',
      email: 'draymond@gmail.com',
      password: 'password'
    )
    akalife = Release.create!(
      title: 'Symphony no. 6',
      performer: '',
      artist: 'Beethoven',
      year: 1900,
      studio: 'morrison',
      no_of_tracks: 3,
      album_art_url: 'http://www.beethovenphoto.com',
      description: '',
      user: jmauran
    )

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'draymond@gmail.com'
    fill_in "Password", with: 'password'
    click_button "Log in"

    visit release_path(akalife)

    expect(page).to_not have_content 'Edit'
  end
end
