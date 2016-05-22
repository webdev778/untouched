class API::Units::IndexController < API::BaseController

  def index
    filter = SolrUnitFilter.new(filter_params)
    render json: units
  end

  private

  def filter_params
    filter_params = params
    filter_params.delete(:action)
    filter_params.delete(:controller)
    filter_params
  end

  def filter
    @filter ||= SolrUnitFilter.new(filter_params)
  end

end

