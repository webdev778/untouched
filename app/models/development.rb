class Development < ActiveRecord::Base
  has_many :units
  mount_uploader :photo, DevelopmentPhotoUploader
  BUILDING_AMENITIES = %w(gym pool spa sauna steam_room rooftop_deck)
  enum development_type: [ :apartment, :townhouse ]
end
