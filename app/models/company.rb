class Company < ActiveRecord::Base
  enum kind: [:agency, :developer]

  has_many :users

  validates :name, presence: true
  validates :kind, inclusion: { in: kinds.keys }
end
