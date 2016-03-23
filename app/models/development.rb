class Development < ActiveRecord::Base
  has_many :units
  mount_uploader :photo, DevelopmentPhotoUploader
end
