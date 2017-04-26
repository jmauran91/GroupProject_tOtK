require 'rails_helper'

feature "user can search artists" do
  scenario "user visits the home page enters search term in the search bar and
    sees search result" do
    danger = User.create!(
      username: 'jbone91',
      email: 'johnmauran1@gmail.com',
      password: 'noneofyourbusiness'
    )
    Release.create!(
      title: 'Brilliant',
      artist: 'James',
      performer: '',
      year: 1987,
      studio: 'Mororsion',
      no_of_tracks: 9,
      album_art_url: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg',
      description: '',
      user: danger
    )
    Release.create!(
      title: 'Incomparable',
      artist: 'Fauntleroy',
      performer: '',
      year: 1987,
      studio: 'Mororsion',
      no_of_tracks: 9,
      album_art_url: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg',
      description: '',
      user: danger
    )

    visit root_path
    fill_in "search", with: 'faun'
    save_and_open_page
    click_button 'Search'

    expect(page).to have_content 'Fauntleroy'
    expect(page).not_to have_content 'James'
  end
  scenario "user enters search which finds no artist and sees failure message" do
    danger = User.create!(
      username: 'jbone91',
      email: 'johnmauran1@gmail.com',
      password: 'noneofyourbusiness'
    )
    Release.create!(
      title: 'Brilliant',
      artist: 'James',
      performer: '',
      year: 1987,
      studio: 'Mororsion',
      no_of_tracks: 9,
      album_art_url: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg',
      description: '',
      user: danger
    )
    Release.create!(
      title: 'Incomparable',
      artist: 'Fauntleroy',
      performer: '',
      year: 1987,
      studio: 'Mororsion',
      no_of_tracks: 9,
      album_art_url: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg',
      description: '',
      user: danger
    )
    visit root_path
    fill_in 'search', with: 'fr'
    click_button 'Search'

    expect(page).not_to have_content 'James'
    expect(page).not_to have_content 'Fauntleroy'
    expect(page).to have_content 'Your search has found nothing'
  end
end
