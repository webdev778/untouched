class Unit < ActiveRecord::Base
  belongs_to :development, counter_cache: true
  enum aspect: [ :north, :east, :south, :west ]
  RESIDENCE_AMENITIES = %w(kitchen_island study_nook storage_cage ensuite walk_in_wardrobe bathtub penthouse_level no_stacker)

  def suburb; development.suburb; end

  searchable do
    integer :bedrooms
    integer :bathrooms
    integer :parking
    double :internal_in_meters
    double :master_bedroom_in_meters
    string(:aspect) { Unit.aspects[self.aspect] }
    double :price
    date(:ready_at) { development.ready_at }
    string(:development_id_str) { development_id.to_s }
    integer(:region_id) { suburb.region_id }
    integer(:suburb_id) { suburb.id }
    double :max_body_corporate_fee
    Unit::RESIDENCE_AMENITIES.each do |key|
      boolean key
    end
    Development::BUILDING_AMENITIES.each do |key|
      boolean(key) { development.send(key) }
    end
    string(:development_type) { development.development_type }
    double(:ceiling_height_at_living_area_in_meters) { development.ceiling_height_at_living_area_in_meters }
    integer(:units_count) { development.units_count }
  end
end
