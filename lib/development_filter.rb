class DevelopmentFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  def results
    ResultSet.new.
      filter_bedrooms(params[:bedrooms]).
      filter_bathrooms(params[:bathrooms]).
      filter_parking(params[:parking]).
      filter_internal_in_meters(params[:internal_in_meters]).
      filter_master_bedroom_in_meters(params[:master_bedroom_in_meters]).
      filter_external_in_meters(params[:external_in_meters]).
      filter_aspect(params[:aspect]).
      filter_max_price(params[:max_price]).
      group_by_development.
      order_by_ascending_price.
      reduce_by_distinct_developments
  end


  class ResultSet

    def initialize(collection=Unit.all)
      @collection = collection
    end

    attr_reader :collection

    def filter_bedrooms(bedrooms)
      filter_count(:bedrooms, bedrooms)
    end

    def filter_bathrooms(bathrooms)
      filter_count(:bathrooms, bathrooms)
    end

    def filter_parking(parking)
      filter_count(:parking, parking)
    end

    def filter_internal_in_meters(internal_in_meters)
      where_greater_than(:internal_in_meters, internal_in_meters)
    end

    def filter_master_bedroom_in_meters(master_bedroom_in_meters)
      where_greater_than(:master_bedroom_in_meters, master_bedroom_in_meters)
    end

    def filter_external_in_meters(external_in_meters)
      where_greater_than(:external_in_meters, external_in_meters)
    end

    def filter_aspect(aspects)
      where_if(aspect: (aspects || []).map {|a| Unit.aspects[a]}) { aspects.present? && aspects.any? }
    end

    def filter_max_price(max_price)
      where_if(['price <= ?', max_price])   { max_price.present? }
    end

    def group_by_development
      group('units.development_id, units.id')
    end

    def order_by_ascending_price
      order('price ASC')
    end

    def reduce_by_distinct_developments
      to_a.uniq {|e| e.development.id}
    end




    protected

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

end

