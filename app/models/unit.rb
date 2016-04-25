class Unit < ActiveRecord::Base
  belongs_to :development, counter_cache: true
  enum aspect: [ :north, :east, :south, :west ]
  enum status: [ :active, :held, :sold ]

  scope :active, -> { where(status: Unit.statuses[:active]) }
  scope :sold, -> { where(status: Unit.statuses[:sold]) }
  scope :held, -> { where(status: Unit.statuses[:held]) }

  validates_uniqueness_of :number, scope: :development_id

  has_many :views, class_name: 'UnitView', as: :imageable, dependent: :destroy
  has_many :plans, class_name: 'UnitPlan', as: :imageable, dependent: :destroy

  RESIDENCE_AMENITIES = %w(kitchen_island study_nook storage_cage ensuite walk_in_wardrobe bathtub penthouse_level no_stacker)

  def deposit_due_in_days
    development.deposit_due_in_days
  end

  def deposit_percent
    development.deposit_percent
  end

  def deposit
    price * deposit_percent
  end
end
