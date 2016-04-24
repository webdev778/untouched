class UnitSerializer < ActiveModel::Serializer

  has_one :development

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
    :created_at,
    :updated_at

end

