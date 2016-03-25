class API::DevelopmentsController < API::BaseController

  def index
    render json: ActiveModel::ArraySerializer.new(
      DevelopmentFilter.new(params).results,
      each_serializer: UnitSerializer
    ).as_json
  end

end

