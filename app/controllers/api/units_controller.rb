class API::UnitsController < API::BaseController

  def index
    units = Unit.where(
      development_id: params[:development_id]
    )

    if params[:status]
      units = units.where(status: params[:status])
    end

    render json: units
  end

  def show
    unit = Unit.where(development_id: params[:development_id], id: params[:id]).first
    render json: UnitSerializer.new(unit).as_json
  end

  def create
    params.require(:unit).permit!

    unit = Unit.new(params[:unit])
    if unit.save
      render json: UnitSerializer.new(unit).as_json
    else
      render json: unit.errors, status: 406
    end
  end

  def update
    params.require(:id)
    params.require(:unit).permit!

    unit = Unit.find(params[:id])
    if unit.update_attributes(params[:unit])
      render json: UnitSerializer.new(unit).as_json
    else
      render json: unit.errors, status: 406
    end
  end

  def destroy
    params.require(:id)

    unit = Unit.find(params[:id])
    unit.destroy

    render nothing: true
  end
end

