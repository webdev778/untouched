class Unit < ActiveRecord::Base
  belongs_to :development
  enum aspect: [ :north, :east, :south, :west ]
end
