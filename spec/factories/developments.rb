FactoryGirl.define do

  factory :development do
    unless Rails.env.test?
      photo { open("http://lorempixel.com/#{Faker::Number.between(400, 1000)}/#{Faker::Number.between(400, 1000)}/city") }
    end
    suburb
    development_type { Faker::Number.between(0, 1) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    ready_at { Faker::Date.forward(180) }
    gym { Faker::Boolean.boolean }
    pool { Faker::Boolean.boolean }
    spa { Faker::Boolean.boolean }
    sauna { Faker::Boolean.boolean }
    steam_room { Faker::Boolean.boolean }
    rooftop_deck { Faker::Boolean.boolean }
    has_double_glazed_windows { Faker::Boolean.boolean }
    ceiling_height_at_living_area_in_meters { Faker::Number.between(24, 50).to_f / 10 }
    deposit_percent { Faker::Number.between(1, 50).to_f / 100 }

    transient do
      units_count { Faker::Number.between(10, 100) }
      images_count { Faker::Number.between(1,4) }
    end

    after :create do |development, evaluator|
      create_list :unit, evaluator.units_count, development: development
      unless Rails.env.test?
        create_list :image, evaluator.images_count, imageable: development
      end
    end
  end

end
