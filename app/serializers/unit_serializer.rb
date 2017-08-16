class UnitSerializer < ActiveModel::Serializer

  has_one :development

  has_many :views
  has_many :plans

  attributes :id,
    :status,
    :unit_type,
    :development_id,
    :number,
    :price,
    :price_per_m2,
    :bedrooms,
    :bathrooms,
    :parking,
    :internal_in_meters,
    :master_bedroom_in_meters,
    :external_in_meters,
    :aspect,
    :study_nook,
    :study_room,
    :storage_cage,
    :no_stacker,
    :max_body_corporate_fee,
    :development_logo_url,
    :deposit_percent,
    :deposit_due_in_days,
    :annual_council_rate,
    :water_rates,
    :deposit,
    :contract_url,
    :created_at,
    :updated_at,
    :views_count,
    :plans_count,
    :visits_count,
    :car_park_lot,
    :storage_lot

  def visits_count
    object.impressionist_count(:start_date => 7.days.ago, :end_date => DateTime.now)
  end  

  def views_count
    object.views.count
  end

  def plans_count
    object.plans.count
  end

  def development_logo_url
    # object.development.development_logo.try(:url).sub! 'development_logo', 'logo'
    object.development.development_logo.try(:url)
  end

end

