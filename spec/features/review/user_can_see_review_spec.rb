require 'rails_helper'

feature "user can see reviews" do
  scenario "user visits the release page and sees reviews" do
    danger = User.create!(username: 'jbone91', email: 'johnmauran1@gmail.com', password: 'noneofyourbusiness')
    new_release = Release.create!(title: 'Album', artist: 'Artist', year: 1987, studio: 'Mororsion', no_of_tracks: 9, album_art_url: 'http://tasteofcountry.com/files/2011/03/ralph-mooney.jpg', user: danger)
    new_review = Review.create!(rating: 89, body: 'This is such a great release!', user: danger, release: new_release)
    visit release_path(new_release)
    expect(page).to have_content "Review Body"
    expect(page).to have_content new_review.body

  end
end
