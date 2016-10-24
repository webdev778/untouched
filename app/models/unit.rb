class Unit < ActiveRecord::Base
  belongs_to :development, counter_cache: true
  has_many :views, -> { order('sort, id ASC') }, class_name: 'UnitView', as: :imageable, dependent: :destroy
  has_many :plans, -> { order('sort, id ASC') }, class_name: 'UnitPlan', as: :imageable, dependent: :destroy

  enum unit_type: [ :apartment, :townhouse ]
  enum aspect: [ :north, :east, :south, :west ]
  enum status: [ :active, :held, :sold ]

  scope :active, -> { where(status: Unit.statuses[:active]) }
  scope :sold, -> { where(status: Unit.statuses[:sold]) }
  scope :held, -> { where(status: Unit.statuses[:held]) }

  validates_uniqueness_of :number, scope: :development_id
  validates_presence_of :number
  validates_presence_of :price
  validates_presence_of :development_id
  validates_presence_of :bedrooms
  validates_presence_of :bathrooms
  validates_presence_of :parking
  validates_presence_of :internal_in_meters
  validates_presence_of :external_in_meters
  validates_presence_of :aspect
  validates_presence_of :max_body_corporate_fee
  validates_presence_of :annual_council_rate

  RESIDENCE_AMENITIES = %w(study_nook study_room storage_cage no_stacker)


  FACETS =
    %w(price bedrooms bathrooms internal_in_meters external_in_meters max_body_corporate_fee parking aspect unit_type) +
    RESIDENCE_AMENITIES
  DEVELOPMENT_FACETS =
    %w(city region_name suburb_name ready_at units_count) +
    Development::BUILDING_AMENITIES

  searchable do
    FACETS.each do |facet_name|
      string(:"facet__#{facet_name}") { send(facet_name).to_s }
    end
    DEVELOPMENT_FACETS.each do |facet_name|
      string(:"facet__#{facet_name}") { development.send(facet_name).to_s }
    end

    string(:group__development_id) { development_id.to_s }

    boolean :private do
      development.private
    end
    string :number
    string :status
    integer :bedrooms
    double :bathrooms
    integer :parking
    double :internal_in_meters
    double :external_in_meters
    double :master_bedroom_in_meters
    string :aspect
    double :price
    date(:ready_at) { development.ready_at }
    integer(:development_id) { development_id }
    integer(:region_id) { suburb.region_id }
    integer(:suburb_id) { suburb.id }
    double :max_body_corporate_fee
    Unit::RESIDENCE_AMENITIES.each do |key|
      boolean key
    end
    Development::BUILDING_AMENITIES.each do |key|
      boolean(key) { development.send(key) }
    end
    string :unit_type
    integer(:units_count) { development.units_count }
  end

  def suburb; development.suburb; end

  def price_per_m2
    price / (internal_in_meters + external_in_meters)
  end

  def deposit_due_in_days
    development.deposit_due_in_days
  end

  def deposit_percent
    development.deposit_percent
  end

  def deposit
    price * deposit_percent
  end

  def contract_url
    development.contract_url
  end

  def to_s
    [ development.to_s, "##{number}" ].join(' ')
  end
end

