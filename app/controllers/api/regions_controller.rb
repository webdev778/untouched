class API::RegionsController < API::BaseController
  
  def index
    regions = Region.all.includes(:suburbs)
    render json: ActiveModel::ArraySerializer.new(regions, each_serializer: RegionSerializer).as_json
  end

end
