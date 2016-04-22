class SolrDevelopmentFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  def results
    ResultSet.new(
      search.group(:development_id_str).groups.map do |group|
        group.results.first
      end.compact
    ).sort(params[:sort], params[:sort_order])
  end

  def search
    @search ||= Unit.search(include: [:development]) do
      group :development_id_str do
        order_by :price, :asc
      end

      with(:bedrooms, params[:bedrooms])                                  
      with(:bathrooms, params[:bathrooms])                                if params[:bathrooms]
      with(:parking, params[:parking])                                    if params[:parking]
      with(:internal_in_meters).greater_than(params[:internal_in_meters]) if params[:internal_in_meters]
      with(:master_bedroom_in_meters).greater_than(params[:master_bedroom_in_meters]) if params[:master_bedroom_in_meters]
      with(:external_in_meters).greater_than(params[:external_in_meters]) if params[:external_in_meters]
      with(:aspect, params[:aspect]) if params[:aspect].present? && params[:aspect].any?
      with(:price).less_than_or_equal_to(params[:max_price]) if params[:max_price].present?
      with(:ready_at).less_than(params[:ready_at]) if params[:ready_at].present?

      facet :bathrooms
      paginate per_page: 10000
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
