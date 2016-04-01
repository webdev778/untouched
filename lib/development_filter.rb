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
      filter_ready_at(params[:ready_at]).
      filter_region(params[:region]).
      filter_suburb(params[:suburb]).
      filter_max_body_corporate_fee(params[:max_body_corporate_fee]).
      filter_residence_amenities(params).
      filter_building_amenities(params).
      filter_development_type(params[:development_type]).
      filter_ceiling_height_at_living_area_in_meters(params[:ceiling_height_at_living_area_in_meters]).
      filter_units_count(params[:units_count]).
      group_by_development.
      order_by_sort_field(params[:sort], params[:sort_order]).
      reduce_by_distinct_developments
  end


  class ResultSet

    def initialize(collection=Unit.all.joins(:development => :suburb))
      @collection = collection
    end

    attr_reader :collection

    def filter_region(region_id)
      where_if(["suburbs.region_id = ?", region_id]) { region_id.present? }
    end

    def filter_suburb(suburb_ids)
      where_if(["suburbs.id IN (?)", suburb_ids]) { suburb_ids.present? && suburb_ids.any? }
    end

    def filter_units_count(units_count)
      where_less_than(:units_count, units_count)
    end

    def filter_residence_amenities(params)
      Unit::RESIDENCE_AMENITIES.inject(self) do |_, key|
        _.filter_boolean(key, params[key])
      end
    end

    def filter_building_amenities(params)
      Development::BUILDING_AMENITIES.inject(self) do |_, key|
        _.filter_boolean("developments.#{key}", params[key])
      end
    end

    def filter_development_type(development_types)
      where_if(
        ['developments.development_type IN (?)', 
          (development_types || []).map {|i| Development.development_types[i]} ]
      ) { development_types.present? && development_types.any? }
    end

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

    def filter_ready_at(ready_at)
      where_if(['ready_at < ?', ready_at])  { ready_at.present? }
    end

    def filter_max_body_corporate_fee(max_body_corporate_fee)
      where_if(['max_body_corporate_fee <= ?', max_body_corporate_fee])   { max_body_corporate_fee.present? }
    end

    def filter_ceiling_height_at_living_area_in_meters(value)
      where_greater_than(:ceiling_height_at_living_area_in_meters, value)
    end

    def group_by_development
      group('units.development_id, units.id, suburbs.name')
    end

    def order_by_sort_field(sort, sort_order='asc')
      sort_order = sort_order == 'desc' ? 'DESC' : 'ASC'

      case sort
      when 'suburb'
        order("suburbs.name #{sort_order}")
      else
        order("price #{sort_order}")
      end
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

    def filter_boolean(column, value)
      where_if(column => true) { value }
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

    def where_less_than(column, value)
      where_if(["#{column} < ?", value]) { value.present? }
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

