class DevelopmentSerializer < ActiveModel::Serializer

  has_many :photos
  has_one :logo

  attributes :id,
    :address,
    :city, 
    :region_name, 
    :suburb_name, 
    :ready_at,
    :gym,
    :pool,
    :spa,
    :sauna,
    :steam_room,
    :rooftop_deck,
    :has_double_glazed_windows,
    :ceiling_height_at_living_area_in_meters,
    :created_at,
    :updated_at

  def region_name
    object.region.name
  end

  def suburb_name
    object.suburb.name
  end

end

