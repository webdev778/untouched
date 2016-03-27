class Development < ActiveRecord::Base
  belongs_to :suburb
  has_many :units
  mount_uploader :photo, DevelopmentPhotoUploader
  BUILDING_AMENITIES = %w(gym pool spa sauna steam_room rooftop_deck)
  enum development_type: [ :apartment, :townhouse ]

  def region
    suburb.region
  end
end
