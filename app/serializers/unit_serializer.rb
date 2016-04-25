class UnitSerializer < ActiveModel::Serializer

  has_one :development

  has_many :views
  has_many :plans

  attributes :id,
    :development_id,
    :number,
    :price,
    :bedrooms,
    :bathrooms,
    :parking,
    :internal_in_meters,
    :master_bedroom_in_meters,
    :external_in_meters,
    :aspect,
    :kitchen_island,
    :ensuite,
    :study_nook,
    :storage_cage,
    :walk_in_wardrobe,
    :bathtub,
    :penthouse_level,
    :no_stacker,
    :max_body_corporate_fee,
    :development_logo,
    :stamp_duty,
    :deposit_percent,
    :deposit_due_in_days,
    :stamp_duty_savings,
    :annual_council_rate,
    :deposit,
    :created_at,
    :updated_at


  def development_logo
    DevelopmentLogoSerializer.new(object.development.logo).as_json(root: false)
  end

end

