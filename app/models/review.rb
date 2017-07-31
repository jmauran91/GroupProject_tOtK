class Review < ApplicationRecord
  validates :body, presence: true
  validates :rating, numericality: true, :inclusion => 1..100
  validates :votes, numericality: true

  belongs_to :user
  belongs_to :release
  has_many :upvotes
  has_many :downvotes



end
