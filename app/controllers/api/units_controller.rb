class API::UnitsController < API::BaseController

  def index
    units = Unit.active.where(
      development_id: params[:development_id]
    )
    render json: units
  end

  def show
    unit = Unit.where(development_id: params[:development_id], id: params[:id]).first
    render json: UnitSerializer.new(unit).as_json
  end

end

