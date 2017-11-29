class Development < ActiveRecord::Base
  belongs_to :suburb
  has_many :units, dependent: :destroy
  has_many :photos, -> { order('sort, id ASC') }, class_name: 'DevelopmentPhoto', as: :imageable, dependent: :destroy
  has_many :videos, -> { order('sort, id ASC') }, class_name: 'DevelopmentVideo', as: :videoable, dependent: :destroy
  is_impressionable
  BUILDING_AMENITIES = %w(gym pool spa sauna steam_room rooftop_deck)
  mount_uploader :contract, ContractUploader
  mount_uploader :development_logo, DevelopmentLogoUploader
  mount_uploader :developer_logo, DeveloperLogoUploader

  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :suburb_id
  validates_presence_of :ready_at
  validates_presence_of :deposit_percent
  validates_presence_of :deposit_due_in_days

  before_save :geocode_if_address_changed
  after_commit :reindex_units


  def region
    suburb.region
  end

  def region_name
    region.name
  end

  def suburb_name
    suburb.name
  end

  def to_s
    [ address, suburb.name ].join(', ')
  end

  def full_address
    [ address, suburb.name ].join(', ')
  end

  def geo_address
    [ address, suburb.name, 'Australia' ].join(', ')
  end

  def contract_url
    contract.url
  end

  protected

  def geocode_if_address_changed
    if address_changed? ||
      city_changed? ||
      suburb_id_changed?

      geo = Geokit::Geocoders::GoogleGeocoder.geocode(geo_address)

      self.lat, self.lng = geo.ll.split(',')
    end
  end

  def reindex_units
    units.each {|u| u.solr_index}
  end
end
