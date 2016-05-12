class Enquiry < ActiveRecord::Base
  belongs_to :unit

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :body
  validates_presence_of :unit_id
end
