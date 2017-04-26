require 'factory_girl'

FactoryGirl.define do

   factory :user do
    sequence(:username) { |n| "test_user_1#{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:id) { |n| }
    role 'member'
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
    sequence(:id) { |n| }
  end

  factory :review do
    body 'I loved this'
    rating 100
    sequence(:id) { |n| }
  end

  factory :comment do
    body "This review is too short"
    sequence(:id) { |n| }
  end
end
