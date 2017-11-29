FactoryGirl.define do
  factory :suburb do
    name { Faker::Name.last_name }
    region
  end
end
