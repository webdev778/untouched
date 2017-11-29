require "administrate/field/base"

class HasManyDevelopmentVideosField < Administrate::Field::Base
  def to_s
    if data.length == 0
      'Add Videos'
    else
      [ data.length, 'videos' ].join(' ')
    end
  end
end
