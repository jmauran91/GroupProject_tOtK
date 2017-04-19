class Release < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :performer
  validates :year, presence: true, numericality: true
  validates :studio, presence: true
  validates :no_of_tracks, presence: true, numericality: true
  validates :album_art_url, presence: true


  belongs_to :user
end
