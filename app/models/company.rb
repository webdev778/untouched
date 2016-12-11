class Company < ActiveRecord::Base
  enum type: [:agency, :developer]

  has_many :users

  validates :name, presence: true
  validates :type, inclusion: { in: types.keys }
end
