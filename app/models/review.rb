class Review < ApplicationRecord
  validates :body, presence: true
  validates :rating, numericality: true
  validates :votes, numericality: true

  belongs_to :user
  belongs_to :release
  has_many :comments
end
