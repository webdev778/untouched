class Development < ActiveRecord::Base
  belongs_to :suburb
  has_many :units, dependent: :destroy
  has_many :photos, class_name: 'DevelopmentPhoto', as: :imageable, dependent: :destroy
  has_one :logo, class_name: 'DevelopmentLogo', as: :imageable, dependent: :destroy
  BUILDING_AMENITIES = %w(gym pool spa sauna steam_room rooftop_deck)
  enum development_type: [ :apartment, :townhouse ]

  before_save :geocode_if_address_changed

  def region
    suburb.region
  end

  def to_s
    [ address, suburb.name ].join(', ')
  end

  def full_address
    [ address, suburb.name, 'Australia' ].join(', ')
  end

  protected

  def geocode_if_address_changed
    if address_changed? ||
      city_changed? ||
      suburb_id_changed?

      geo = Geokit::Geocoders::GoogleGeocoder.geocode(full_address)

      self.lat, self.lng = geo.ll.split(',')
    end
  end
end
