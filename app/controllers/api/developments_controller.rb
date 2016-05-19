class API::DevelopmentsController < API::BaseController

  def index
    render json: {
      developments: developments_json,
      filters: filter.params,
      facets: filter.facets
    }
  end

  def show
    development = Development.find(params[:id])
    render json: DevelopmentSerializer.new(development).as_json
  end

  private

  def filter_params
    filter_params = params
    filter_params.delete(:action)
    filter_params.delete(:controller)
    filter_params
  end

  def filter
    @filter ||= SolrDevelopmentFilter.new(filter_params)
  end

  def developments_json
    ActiveModel::ArraySerializer.new(
      filter.results,
      each_serializer: UnitSerializer
    ).as_json(root: false)
  end

end

