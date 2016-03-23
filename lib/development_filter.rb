class DevelopmentFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  class ResultSet

    def initialize(collection=Unit.all)
      @collection = collection
    end

    attr_reader :collection

    def where_if(conditions, &block)
      if block.call
        ResultSet.new(collection.where(conditions))
      else
        ResultSet.new(collection)
      end
    end

    def order(*args)
      ResultSet.new(collection.order(*args))
    end

    def group(*args)
      ResultSet.new(collection.group(*args))
    end

    def to_a
      @collection.to_a
    end
  end

  def results
    ResultSet.new.
      where_if(bedrooms: params[:bedrooms])          { params[:bedrooms] }.
      where_if(bathrooms: params[:bathrooms])        { params[:bathrooms] }.
      where_if(['price <= ?', params[:max_price]])  { params[:max_price].present? }.
      group('units.development_id, units.id').
      order('price ASC').
      to_a.uniq {|e| e.development.id}
  end

end

