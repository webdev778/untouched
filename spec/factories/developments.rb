FactoryGirl.define do

  factory :development do
    photo { open("http://lorempixel.com/#{Faker::Number.between(400, 1000)}/#{Faker::Number.between(400, 1000)}/city") }
    city { Faker::Address.city }
    region { Faker::Address.state }
    suburb { Faker::Address.street_address }
    ready_at { Faker::Date.forward(180) }
    gym { Faker::Boolean.boolean }
    pool { Faker::Boolean.boolean }
    spa { Faker::Boolean.boolean }
    sauna { Faker::Boolean.boolean }
    steam_room { Faker::Boolean.boolean }
    rooftop_deck { Faker::Boolean.boolean }
    has_double_glazed_windows { Faker::Boolean.boolean }
    ceiling_height_at_living_area_in_meters { Faker::Number.between(24, 50).to_f / 10 }

    transient do
      units_count Faker::Number.between(10, 100)
    end

    after :create do |development, evaluator|
      create_list :unit, evaluator.units_count, development: development
    end
  end

end
