require 'rails_helper'

feature "user sees releases" do
  pending "User goes to the index page and sees releases" do
    akalife = Release.create!(title: 'Symphony no. 6', artist: 'Beethoven', year: 1900, studio: 'morrison', no_of_tracks: 3, album_art_url: 'http://www.beethovenphoto.com')

    visit releases_path

    expect(page).to have_content "Welcome the Kensai Music Review DB"

    expect(akalife).to have_content "Beethoven"

  end
end
