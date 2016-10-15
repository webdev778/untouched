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
    study_nook { Faker::Boolean.boolean }
    study_room { Faker::Boolean.boolean }
    storage_cage { Faker::Boolean.boolean }
    no_stacker { Faker::Boolean.boolean }
    max_body_corporate_fee { Faker::Number.between(2_000, 8_000) }
    annual_council_rate { Faker::Number.between(2_000, 8_000) }
    stamp_duty { Faker::Number.between(1_000, 3_000) }
    stamp_duty_savings { Faker::Number.between(10_000, 30_000) }

    transient do
      plans_count { Faker::Number.between(1,4) }
      views_count { Faker::Number.between(1,4) }
    end

    after :create do |unit, evaluator|
      unless Rails.env.test?
        create_list :unit_plan, evaluator.plans_count, imageable: unit
        create_list :unit_view, evaluator.views_count, imageable: unit
      end
    end
  end
end
