class DevelopmentLogo < Image

  def development
    imageable
  end

  def development_id
    self.development.try(:id)
  end

  def development_id=(development_id)
    self.imageable = Development.find(development_id)
  end
end

