require 'rails_helper'

feature "user submits a new release" do
  pending "visit the new release form page and adds a new release" do
    visit new_release_path
    expect(page).to have_content "New Release Form"


    fill_in 'title', with: 'Symphony no. 6'
    fill_in 'artist', with: 'Beethoven'
    fill_in 'year', with: 1900
    fill_in 'studio', with: 'morrison'
    fill_in 'no_of_tracks', with: '3'
    fill_in 'album_art_url', with: 'geocities.com/beethoven_fanpage/beethoven_the_man.jpg'

    click_button 'Add Release'

    expect(page).to have_content "Beethoven"
    expect(page).to have_content "Symphony no. 6"
  end
end
