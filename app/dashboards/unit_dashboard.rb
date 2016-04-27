require "administrate/base_dashboard"

class UnitDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    development: Field::BelongsTo,
    number: Field::String,
    id: Field::Number,
    status: EnumField,
    price: Field::Number.with_options(prefix: '$', decimals: 0),
    bedrooms: Field::Number,
    bathrooms: Field::Number,
    parking: Field::Number,
    internal_in_meters: Field::String.with_options(searchable: false),
    master_bedroom_in_meters: Field::String.with_options(searchable: false),
    external_in_meters: Field::String.with_options(searchable: false),
    aspect: Field::String.with_options(searchable: false),
    kitchen_island: Field::Boolean,
    ensuite: Field::Boolean,
    study_nook: Field::Boolean,
    storage_cage: Field::Boolean,
    walk_in_wardrobe: Field::Boolean,
    bathtub: Field::Boolean,
    penthouse_level: Field::Boolean,
    no_stacker: Field::Boolean,
    max_body_corporate_fee: Field::Number.with_options(prefix: '$', decimals: 0),
    annual_council_rate: Field::Number.with_options(prefix: '$', decimals: 0),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :development,
    :price,
    :bedrooms,
    :bathrooms,
    :parking
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :development,
    :status,
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
    :annual_council_rate
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :development,
    :number,
    :status,
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
    :annual_council_rate
  ]

  # Overwrite this method to customize how units are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(unit)
    "Unit ##{unit.id}"
  end
end
