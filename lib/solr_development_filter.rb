class SolrDevelopmentFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  def results
    ResultSet.
      new(search.results).
      sort(params[:sort], params[:sort_order])
  end

  def search
    @search ||= SolrSearch.new(params)
  end

  def facets
    search.facets
  end

  class SolrSearch

    GROUP_BY           = :group__development_id
    PAGINATION_OPTIONS = { per_page: 10000 }
    FACET_PREFIX       = 'facet__'

    def initialize(params)
      @delegate = Unit.search(solr_options) do
        group(GROUP_BY)
        paginate(PAGINATION_OPTIONS)

        filters = {}

        if params[:bedrooms]
          with(:bedrooms, params[:bedrooms])
        end

        if params[:bathrooms]
          with(:bathrooms, params[:bathrooms])
        end

        if params[:parking]
          with(:parking, params[:parking])
        end

        if params[:internal_in_meters]
          with(:internal_in_meters).greater_than(params[:internal_in_meters])
        end

        if params[:external_in_meters]
          with(:external_in_meters).greater_than(params[:external_in_meters]) 
        end

        if params[:aspect].present? && params[:aspect].any?
          with(:aspect, params[:aspect])
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
          with(:suburb_id, params[:suburb])
        end

        if params[:max_body_corporate_fee].present?
          with(:max_body_corporate_fee).less_than_or_equal_to(params[:max_body_corporate_fee])
        end

        Unit::RESIDENCE_AMENITIES.each do |key|
          with(key, true) if params[key]
        end

        Development::BUILDING_AMENITIES.each do |key|
          with(key, true) if params[key]
        end

        if params[:development_type].present?
          with(:development_type, params[:development_type])
        end




        adjust_solr_params do |params|
          params['group.facet'] = true
        end

        Unit::FACETS.each do |facet_name|
          facet('facet__' + facet_name)
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

    attr_reader :delegate

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
      delegate.
        group(GROUP_BY).
        groups.
        map(&:results).
        flatten
    end
  end

  class ResultSet

    def initialize(collection)
      @collection = collection
    end

    attr_reader :collection

    def sort(sort, sort_order='asc')
      @collection.sort do |a, b|
        if sort_order == 'desc'
          if sort == 'suburb'
            b.development.suburb.name <=> a.development.suburb.name
          else
            b.price <=> a.price
          end
        else
          if sort == 'suburb'
            a.development.suburb.name <=> b.development.suburb.name
          else
            a.price <=> b.price
          end
        end
      end
    end

  end

end
