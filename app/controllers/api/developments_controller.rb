class API::DevelopmentsController < API::BaseController

  def index
    filter = DevelopmentFilter.new(params)

    render json: {
      developments: developments_json,
      filters: filter.params
    }
  end

  private

  def filter_params
    filter_params = params
    filter_params.delete(:action)
    filter_params.delete(:controller)
    filter_params
  end

  def filter
    @filter ||= DevelopmentFilter.new(filter_params)
  end

  def developments_json
    ActiveModel::ArraySerializer.new(
      filter.results,
      each_serializer: UnitSerializer
    ).as_json(root: false)
  end

end

