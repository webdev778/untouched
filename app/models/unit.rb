class Unit < ActiveRecord::Base
  belongs_to :development, counter_cache: true
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
  validates_presence_of :master_bedroom_in_meters
  validates_presence_of :aspect
  validates_presence_of :max_body_corporate_fee
  validates_presence_of :annual_council_rate


  has_many :views, -> { order('sort, id ASC') }, class_name: 'UnitView', as: :imageable, dependent: :destroy
  has_many :plans, -> { order('sort, id ASC') }, class_name: 'UnitPlan', as: :imageable, dependent: :destroy

  RESIDENCE_AMENITIES = %w(kitchen_island study_nook storage_cage ensuite walk_in_wardrobe bathtub penthouse_level no_stacker)

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
