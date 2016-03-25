class Unit < ActiveRecord::Base
  belongs_to :development, counter_cache: true
  enum aspect: [ :north, :east, :south, :west ]

  RESIDENCE_AMENITIES = %w(kitchen_island study_nook storage_cage ensuite walk_in_wardrobe bathtub penthouse_level no_stacker)
end
