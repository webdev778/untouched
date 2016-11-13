class VideoSerializer < ActiveModel::Serializer
  attributes :id, :iframe, :caption, :caption_html, :sort

  def caption_html
    return nil if object.caption.blank?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(object.caption)
  end
end
