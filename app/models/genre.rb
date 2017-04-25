class Genre < ApplicationRecord
  validates :name, presence: true

  has_many :release_genres
  has_many :releases, through: :release_genres
end
