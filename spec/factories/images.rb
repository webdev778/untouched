FactoryGirl.define do

  factory :development_photo do
    file { open(Rails.root.join('spec', 'fixtures', 'seeds', 'assets', 'example-development-photo.jpg').to_s) }
    caption { Faker::Lorem.sentence }
  end

  factory :development_logo do
    file { open(Rails.root.join('spec', 'fixtures', 'seeds', 'assets', 'example-development-logo.png').to_s) }
  end

  factory :unit_view do
    file { open(Rails.root.join('spec', 'fixtures', 'seeds', 'assets', 'example-unit-view.jpg').to_s) }
    caption { Faker::Lorem.sentence }
  end

  factory :unit_plan do
    file { open(Rails.root.join('spec', 'fixtures', 'seeds', 'assets', 'example-unit-plan.jpg').to_s) }
    caption { Faker::Lorem.sentence }
  end
end
