class ImageSerializer < ActiveModel::Serializer
  attributes :id, :caption, :caption_html, :url, :sort

  def url
    object.file_url
  end

  def caption_html
    return nil if object.caption.blank?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(object.caption)
  end
end
