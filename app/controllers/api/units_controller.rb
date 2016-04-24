class API::UnitsController < API::BaseController

  def index
    units = Unit.where(
      development_id: params[:development_id]
    )
    render json: units
  end

end

