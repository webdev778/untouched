FactoryGirl.define do
  factory :unit do
    price { Faker::Number.between(400_000, 2_000_000) }
    bedrooms { Faker::Number.between(1, 5) }
    bathrooms { Faker::Number.between(1, 4) }
    parking { Faker::Number.between(0, 4) }
    internal_in_meters { Faker::Number.between(40, 200) }
    master_bedroom_in_meters { Faker::Number.between(10, 50) }
    external_in_meters { Faker::Number.between(5, 100) }
    aspect { Faker::Number.between(0, 3) }
    kitchen_island { Faker::Boolean.boolean }
    ensuite { Faker::Boolean.boolean }
    study_nook { Faker::Boolean.boolean }
    storage_cage { Faker::Boolean.boolean }
    walk_in_wardrobe { Faker::Boolean.boolean }
    bathtub { Faker::Boolean.boolean }
    penthouse_level { Faker::Boolean.boolean }
    no_stacker { Faker::Boolean.boolean }
    max_body_corporate_fee { Faker::Number.between(2_000, 8_000) }
  end
end
