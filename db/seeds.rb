# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
