class API::RegionsController < API::BaseController
  
  def index
    render json: find_regions.as_json
  end


  private

  def find_regions
    Development.
      distinct(:region).
      pluck(:region).
      map {|region| { name: region }}
  end
end
