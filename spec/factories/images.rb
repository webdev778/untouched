FactoryGirl.define do
  factory :image do
    file { open("http://lorempixel.com/#{Faker::Number.between(400, 1000)}/#{Faker::Number.between(400, 1000)}/city") }
  end
end
