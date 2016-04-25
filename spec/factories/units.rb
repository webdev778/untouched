FactoryGirl.define do
  factory :unit do
    development
    sequence(:number) {|n| "#{n}A" }
    bedrooms { Faker::Number.between(1, 5) }
    price { Faker::Number.between(bedrooms * 400_000, bedrooms * 500_000) }
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
    annual_council_rate { Faker::Number.between(2_000, 8_000) }
    stamp_duty { Faker::Number.between(1_000, 3_000) }
    stamp_duty_savings { Faker::Number.between(10_000, 30_000) }
  end
end
