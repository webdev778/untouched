require "administrate/field/base"

class HasManyUnitsField < Administrate::Field::Base
  def to_s
    "#{data.length} units"
  end
end
