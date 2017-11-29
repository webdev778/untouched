require "administrate/base_dashboard"

class ImageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    imageable: Field::Polymorphic,
    id: Field::Number,
    sort: Field::Number,
    file: CarrierwaveField,
    caption: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :imageable,
    :file,
    :caption,
    :sort
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :imageable,
    :file,
    :caption,
    :sort
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :imageable,
    :file,
    :caption,
    :sort
  ]

  # Overwrite this method to customize how development photos are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(development_photo)
    "Photo of #{development_photo.imageable.to_s}"
  end
end
