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

    def where(*args)
      ResultSet.new(collection.where(*args))
    end

    def filter_count(column, value)
      return self if value.blank?

      if data = value.match(/^(\d)\+$/)
        where(["#{column} >= ?", data[1]])
      else
        where(column => value)
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
      filter_count(:bedrooms, params[:bedrooms]).
      filter_count(:bathrooms, params[:bathrooms]).
      filter_count(:parking, params[:parking]).
      where_if(['internal_in_meters > ?', params[:internal_in_meters]]) { params[:internal_in_meters].present? }.
      where_if(['price <= ?', params[:max_price]])   { params[:max_price].present? }.
      group('units.development_id, units.id').
      order('price ASC').
      to_a.uniq {|e| e.development.id}
  end

end

