require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username 'username'
    email 'email@gmail.com'
    password 'password'
  end

  factory :release do
    title 'Symphony no. 6'
    performer ''
    artist 'Beethoven'
    year 1900
    studio 'morrison'
    no_of_tracks 3
    album_art_url 'http://www.beethovenphoto.com'
    description ''
  end

  factory :review do
    body 'I loved this'
    rating 100

  end

  factory :comment do
    body "This review is too short"

  end
end
