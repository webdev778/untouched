class API::Units::IndexController < API::BaseController

  def index
    filter = SolrUnitFilter.new(filter_params)
    render json: {
      units: units_json,
      filters: filter.params,
      facets: filter.facets
    }
  end

  private

  def filter_params
    filter_params = params
    filter_params.delete(:action)
    filter_params.delete(:controller)
    filter_params = filter_params.merge({status: "any"})
    filter_params
  end

  def filter
    @filter ||= SolrUnitFilter.new(filter_params)
  end

  def units_json
    ActiveModel::ArraySerializer.new(
      filter.results,
      each_serializer: UnitSerializer
    ).as_json(root: false)
  end

end

