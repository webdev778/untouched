require "administrate/base_dashboard"

class DevelopmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    units: HasManyUnitsField,
    private: Field::Boolean,
    show_on_home_page: Field::Boolean,
    show_per_m2: Field::Boolean,
    id: Field::Number,
    lat: Field::Number,
    lng: Field::Number,
    address: Field::String,
    city: Field::String,
    region: Field::BelongsTo,
    suburb: Field::BelongsTo,
    full_address: Field::String,
    ready_at: Field::DateTime,
    gym: Field::Boolean,
    pool: Field::Boolean,
    spa: Field::Boolean,
    sauna: Field::Boolean,
    steam_room: Field::Boolean,
    rooftop_deck: Field::Boolean,
    has_double_glazed_windows: Field::Boolean,
    deposit_percent: Field::Number.with_options(decimals: 2),
    deposit_due_in_days: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    development_logo: CarrierwaveField,
    developer_logo: CarrierwaveField,
    photos: HasManyDevelopmentPhotosField,
    videos: HasManyDevelopmentVideosField,
    contract: CarrierwaveField,
    intercom_app_id: Field::String
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :full_address,
    :units
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :private,
    :show_on_home_page,
    :show_per_m2,
    :lat,
    :lng,
    :development_logo,
    :developer_logo,
    :units,
    :photos,
    :videos,
    :ready_at,
    :gym,
    :pool,
    :spa,
    :sauna,
    :steam_room,
    :rooftop_deck,
    :has_double_glazed_windows,
    :deposit_percent,
    :deposit_due_in_days,
    :contract,
    :intercom_app_id
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :private,
    :show_on_home_page,
    :show_per_m2,
    :development_logo,
    :developer_logo,
    :lat,
    :lng,
    :address,
    :city,
    :suburb,
    :units,
    :ready_at,
    :gym,
    :pool,
    :spa,
    :sauna,
    :steam_room,
    :rooftop_deck,
    :has_double_glazed_windows,
    :deposit_percent,
    :deposit_due_in_days,
    :contract,
    :intercom_app_id
  ]

  # Overwrite this method to customize how developments are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(development)
    development.to_s
  end
end
