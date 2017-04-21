class Release < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
<<<<<<< HEAD
  validates :year, presence: true, numericality: { only_integer: true }
  validates :studio, presence: true
=======
  validates :year, presence: true, inclusion: { in: 1850..Date.today.year, message: 'is not valid' }
>>>>>>> ddd19e56876dc9d05c77df09278298239bfc8ada
  validates :no_of_tracks, presence: true, numericality: true
  validates :album_art_url, format: { with: /\A(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/, message: "is invalid" }

  belongs_to :user
  has_many :reviews
end
