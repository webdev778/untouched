require "administrate/field/base"

class HasManyDevelopmentPhotosField < Administrate::Field::Base
  def to_s
    if data.length == 0
      'Add Photos'
    else
      [ data.length, 'photos' ].join(' ')
    end
  end
end
