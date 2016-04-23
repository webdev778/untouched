class ImageSerializer < ActiveModel::Serializer
  attributes :id, :caption, :url

  def url
    object.file_url
  end
end
