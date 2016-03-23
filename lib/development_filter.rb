class DevelopmentFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  def results
    base = Unit.all

    if params[:bedrooms]
      base = base.
        where(bedrooms: params[:bedrooms])
    end

    if params[:bathrooms]
      base = base.
        where(bathrooms: params[:bathrooms])
    end

    if params[:max_price].present?
      base = base.
        where(['price <= ?', params[:max_price]])
    end

    base.
      group('units.development_id, units.id').
      order('price ASC').
      to_a.uniq {|e| e.development.id}
  end

end

