class DevelopmentVideo < Video

  def development
    videoable
  end

  def development_id
    self.development.try(:id)
  end

  def development_id=(development_id)
    self.videoable = Development.find(development_id)
  end

end

