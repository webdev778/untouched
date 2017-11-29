# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "- ALL"
[ Development, Unit, Suburb, Region ].each(&:delete_all)

10.times do
  region = FactoryGirl.create(:region)
  puts "+ REGION #{region.name}"
  region.suburbs.each do |suburb|
    puts "\t + SUBURB #{suburb.name}"
  end
end

50.times do
  region = Region.all.sample
  suburb = region.suburbs.sample
  development = FactoryGirl.create(:development, suburb: suburb)
  puts "+ DEVELOPMENT #{development.address}, #{development.suburb.name}, #{development.region.name}, #{development.units_count} units"
end

