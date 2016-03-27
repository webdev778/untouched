class API::RegionsController < API::BaseController
  
  def index
    render json: Region.all.as_json
  end

end
