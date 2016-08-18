class SolrSearch

  def self.result_set_class
    ResultSet
  end

  def group?
    true
  end

  def show_private?
    false
  end

  GROUP_BY           = :group__development_id
  PAGINATION_OPTIONS = { per_page: 10000 }
  FACET_PREFIX       = 'facet__'

  def initialize(params)
    @params = params
    @delegate = Unit.search(solr_options) do
      if group?
        group(GROUP_BY) do
          order_by(:price, :asc)
        end
      else
        order_by(:price, :asc)
      end

      if !show_private?
        with(:private, false)
      end

      paginate(PAGINATION_OPTIONS)

      filters = {}

      unless params[:status] == 'any'
        with(:status, 'active')
      end

      if params[:bedrooms]
        filters['bedrooms'] = with(:bedrooms, params[:bedrooms])
      end

      if params[:bathrooms]
        filters['bathrooms'] = with(:bathrooms, params[:bathrooms])
      end

      if params[:parking]
        filters['parking'] = with(:parking, params[:parking])
      end

      if params[:internal_in_meters]
        with(:internal_in_meters).greater_than(params[:internal_in_meters])
      end

      if params[:external_in_meters]
        with(:external_in_meters).greater_than(params[:external_in_meters])
      end

      if params[:aspect].present? && params[:aspect].any?
        filters['aspect'] = with(:aspect, params[:aspect])
      end

      if params[:max_price].present?
        with(:price).less_than_or_equal_to(params[:max_price])
      end

      if params[:ready_at].present?
        with(:ready_at).less_than(params[:ready_at])
      end

      if params[:region].present?
        filters['region_name'] = with(:region_id, params[:region])
      end

      if params[:suburb].present?
        filters['suburb_name'] = with(:suburb_id, params[:suburb])
      end

      if params[:max_body_corporate_fee].present?
        with(:max_body_corporate_fee).less_than_or_equal_to(params[:max_body_corporate_fee])
      end

      Unit::RESIDENCE_AMENITIES.each do |key|
        filters[key] = with(key, true) if params[key]
      end

      Development::BUILDING_AMENITIES.each do |key|
        filters[key] = with(key, true) if params[key]
      end

      if params[:unit_type].present?
        filters['unit_type'] = with(:unit_type, params[:unit_type])
      end

      if params[:development_id].present?
        with(:development_id, params[:development_id])
      end

      if params[:ceiling_height_at_living_area_in_meters]
        with(:ceiling_height_at_living_area_in_meters).
            greater_than(params[:ceiling_height_at_living_area_in_meters])
      end

      if params[:units_count]
        with(:units_count).
            less_than(params[:units_count])
      end


      if group?
        adjust_solr_params do |params|
          params['group.facet'] = true
        end
      end

      Unit::FACETS.each do |facet_name|
        options = {}
        options[:exclude] = filters[facet_name] if filters[facet_name]
        facet('facet__' + facet_name, options)
      end

      Unit::DEVELOPMENT_FACETS.each do |facet_name|
        options = {}
        options[:exclude] = filters[facet_name] if filters[facet_name]
        facet('facet__' + facet_name, options)
      end

    end
  end

  def facets
    (Unit::FACETS + Unit::DEVELOPMENT_FACETS).inject({}) do |_, facet_name|
      facet = delegate.facet('facet__' + facet_name)
      _.merge(
        facet_name =>
        facet.rows.map do |row|
          [ row.value.to_s, row.count ]
        end
      )
    end
  end

  attr_reader :params, :delegate

  def solr_options
    {
      include: {
        development: {
          suburb: :region
        }
      }
    }
  end

  def fetch_facet(*args)
    delegate.facet(*args)
  end

  def results
    self.class.result_set_class.new(
      delegate.
        group(GROUP_BY).
        groups.
        map {|g| g.results.first}.
        compact.
        flatten
    ).
      sort(params[:sort], params[:sort_order])
  end
end

