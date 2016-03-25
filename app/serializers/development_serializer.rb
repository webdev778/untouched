class DevelopmentSerializer < ActiveModel::Serializer

  attributes :photo_url,
    :address,
    :city, 
    :region, 
    :suburb, 
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

  def photo_url
    object.photo.url
  end

end

