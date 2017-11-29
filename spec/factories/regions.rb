FactoryGirl.define do
  factory :region do
    name { Faker::Name.last_name }

    transient do
      suburbs_count { Faker::Number.between(2, 10) }
    end

    after :create do |region, evaluator|
      create_list :suburb, evaluator.suburbs_count, region: region
    end
  end
end
