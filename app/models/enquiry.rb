class Enquiry < ActiveRecord::Base
  belongs_to :unit

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :body
  validates_presence_of :unit_id

  after_commit :deliver_email, on: :create

  def deliver_email
    Notifier.enquiry(self).deliver_now
  end
end
