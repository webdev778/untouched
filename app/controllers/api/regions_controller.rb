class API::RegionsController < API::BaseController
  
  def index
    render json: ActiveModel::ArraySerializer.new(Region.all, each_serializer: RegionSerializer).as_json
  end

end
