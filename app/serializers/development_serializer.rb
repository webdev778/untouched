class DevelopmentSerializer < ActiveModel::Serializer

  attributes :photo_url,
    :city, 
    :region, 
    :suburb, 
    :ready_at,
    :has_gym,
    :has_pool,
    :has_spa,
    :has_sauna,
    :has_steam_room,
    :has_rooftop_deck,
    :has_double_glazed_windows,
    :ceiling_height_at_living_area_in_meters,
    :created_at,
    :updated_at

  def photo_url
    object.photo.url
  end

end

