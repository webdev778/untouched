class API::DevelopmentsController < ApplicationController

  def index
    render json: ActiveModel::ArraySerializer.new(
      DevelopmentFilter.new(params).results,
      each_serializer: UnitSerializer
    ).as_json(root: false)
  end

end

