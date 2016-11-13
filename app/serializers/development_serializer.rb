class DevelopmentSerializer < ActiveModel::Serializer

  has_many :photos

  attributes :id, :lat, :lng,
    :logo_url,
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
    :deposit_percent,
    :units_count,
    :units_active_count,
    :units_deposit_received_count,
    :created_at,
    :updated_at,
    :intercom_app_id,
    :visits_count

  def visits_count
    object.impressionist_count(:start_date => 7.days.ago, :end_date => DateTime.now)
  end

  def logo_url
    object.logo.try(:url)
  end

  def region_name
    object.region.name
  end

  def suburb_name
    object.suburb.name
  end

  def units_active_count
    object.units.active.count
  end

  def units_deposit_received_count
    object.units.deposit_received.count
  end

end

