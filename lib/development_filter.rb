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

    def sanitize_sql_array(*args)
      ActiveRecord::Base.send(:sanitize_sql_array, *args)
    end

    def filter_count(column, values)
      values = [ values ].flatten.compact # make sure we have a flat array
      return self if values.empty?

      where(
        values.map do |value|
          if data = value.match(/^(\d)\+$/)
            ["#{column} >= ?", data[1]]
          else
            ["#{column} = ?", value]
          end
        end.
          map {|p| sanitize_sql_array(p)}.
          join(' OR ')
      )
    end

    def where_greater_than(column, value)
      where_if(["#{column} > ?", value]) { value.present? }
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
      where_greater_than(:internal_in_meters, params[:internal_in_meters]).
      where_greater_than(:master_bedroom_in_meters, params[:master_bedroom_in_meters]).
      where_greater_than(:external_in_meters, params[:external_in_meters]).
      where_if(['price <= ?', params[:max_price]])   { params[:max_price].present? }.
      group('units.development_id, units.id').
      order('price ASC').
      to_a.uniq {|e| e.development.id}
  end

end

