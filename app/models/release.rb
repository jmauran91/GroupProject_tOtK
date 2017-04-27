class Release < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :year, presence: true, inclusion: { in: 1850..Date.today.year, message: 'is not valid' }
  validates :no_of_tracks, presence: true, numericality: true
  validates :album_art_url, format: { with: /\A(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/, message: "is invalid" }

  belongs_to :user
  has_many :reviews
  has_many :release_genres
  has_many :genres, through: :release_genres
end
