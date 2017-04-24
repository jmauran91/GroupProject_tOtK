class ReleaseGenre < ApplicationRecord
  belongs_to :release
  belongs_to :genre
end
