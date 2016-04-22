class SolrDevelopmentFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  def results
    ResultSet.new(search.results).
      reduce_by_distinct_developments(params[:sort], params[:sort_order])
  end

  def search
    @search ||= Unit.search(include: [:development]) do
      with(:bedrooms, params[:bedrooms]) if params[:bedrooms]
      facet :bathrooms
      paginate per_page: 10000
    end
  end

  class ResultSet

    def initialize(collection)
      @collection = collection
    end

    attr_reader :collection

    def reduce_by_distinct_developments(sort, sort_order='asc')
      @collection.uniq {|e| e.development.id}.
        sort do |a, b|
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
