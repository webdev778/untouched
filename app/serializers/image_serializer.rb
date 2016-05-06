class ImageSerializer < ActiveModel::Serializer
  attributes :id, :caption, :url, :sort

  def url
    object.file_url
  end
end
