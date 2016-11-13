class API::UnitsController < API::BaseController
  impressionist :actions => [:show], :unique => [:impressionable_type, :impressionable_id, :session_hash]

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

