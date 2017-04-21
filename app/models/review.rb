class Review < ApplicationRecord
<<<<<<< HEAD

  validates :body, presence: true
  validates :rating, numericality: true
=======
  validates :body, presence: true
  validates :rating, numericality: true, :inclusion => 1..100
>>>>>>> ddd19e56876dc9d05c77df09278298239bfc8ada
  validates :votes, numericality: true

  belongs_to :user
  belongs_to :release
  has_many :comments
<<<<<<< HEAD

=======
>>>>>>> ddd19e56876dc9d05c77df09278298239bfc8ada
end
