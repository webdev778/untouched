FactoryGirl.define do

  factory :development do
    city { Faker::Address.city }
    region { Faker::Address.state }
    suburb { Faker::Address.city }
    ready_at { Faker::Date.forward(180) }
    has_gym { Faker::Boolean.boolean }
    has_pool { Faker::Boolean.boolean }
    has_spa { Faker::Boolean.boolean }
    has_sauna { Faker::Boolean.boolean }
    has_steam_room { Faker::Boolean.boolean }
    has_rooftop_deck { Faker::Boolean.boolean }
    has_double_glazed_windows { Faker::Boolean.boolean }
    ceiling_height_at_living_area_in_meters { Faker::Number.decimal(2) }
  end

end
