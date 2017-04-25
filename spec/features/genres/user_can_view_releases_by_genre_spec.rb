require 'rails_helper'

feature 'The user can view releases by genre' do
  scenario 'picks a genre from the top bar and selects a specific release to show' do
    genres = [
      "Alternative",
      "Blues",
      "Classical",
      "Country",
      "Dance",
      "Easy Listening",
      "Electronic",
      "European (Folk/Pop)",
      "Hip Hop/Rap",
      "Indie Pop",
      "Inspirational/Gospel",
      "Jazz",
      "Latin",
      "New Age",
      "Opera",
      "Pop",
      "R&B/Soul",
      "Reggae",
      "Rock",
      "World"
    ]

    genres.each do |genre|
      Genre.create(name: genre)
    end

    User.create!(
      username: 'jbone91',
      email: 'johnmauran1@gmail.com',
      password: 'noneofyourbusiness'
      )
    visit new_user_session_path
    fill_in 'Email', with: 'johnmauran1@gmail.com'
    fill_in 'Password', with: 'noneofyourbusiness'
    click_button 'Log in'

    click_link "Add a Release"
    expect(page).to have_content "New Release Form"

    fill_in 'Title', with: 'Great Album'
    fill_in 'Artist', with: 'Great Band'
    fill_in 'Performer', with: 'Great Hands'
    fill_in 'Year', with: 1979
    fill_in 'Studio', with: 'Great Studio'
    fill_in 'No of tracks', with: 9
    fill_in 'Album art url', with: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg'
    page.check 'Blues'
    page.check 'Jazz'

    click_button 'Add Release'
    visit genre_path(Genre.find_by(name: "Blues")) #Blues Genre

    expect(page).to have_content "Great Album"

    visit genre_path(Genre.find_by(name: "Jazz")) #Jazz Genre

    expect(page).to have_content "Great Album"
  end
end
