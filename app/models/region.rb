class Region < ActiveRecord::Base
  has_many :suburbs, -> { order('name ASC') }, dependent: :destroy
end
