require "administrate/field/base"

class CarrierwaveField < Administrate::Field::Base
  def url
    data.url
  end

  def image?
    data.is_a?(ImageUploader)
  end

  def thumbnail
    data.url
  end

  def to_s
    data
  end
end
