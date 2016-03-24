require "administrate/base_dashboard"

class DevelopmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    units: Field::HasMany,
    id: Field::Number,
    city: Field::String,
    region: Field::String,
    suburb: Field::String,
    ready_at: Field::DateTime,
    gym: Field::Boolean,
    pool: Field::Boolean,
    spa: Field::Boolean,
    sauna: Field::Boolean,
    steam_room: Field::Boolean,
    rooftop_deck: Field::Boolean,
    has_double_glazed_windows: Field::Boolean,
    ceiling_height_at_living_area_in_meters: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    photo: Field::Image,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :suburb,
    :units,
    :city,
    :region
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :units,
    :id,
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
    :updated_at,
    :photo,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :units,
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
    :photo,
  ]

  # Overwrite this method to customize how developments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(development)
  #   "Development ##{development.id}"
  # end
end
