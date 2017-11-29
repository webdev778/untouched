class RegionSerializer < ActiveModel::Serializer
  has_many :suburbs
  attributes :id, :name
end

