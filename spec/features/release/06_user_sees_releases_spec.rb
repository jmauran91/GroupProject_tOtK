require 'rails_helper'

feature "user sees releases" do
  scenario "User goes to the index page and sees releases" do
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

    visit releases_path

    expect(page).to have_content "Welcome to the Kensai Music DB"

    expect(akalife.artist).to have_content "Beethoven"

  end
end
