class API::VideosController < API::BaseController

  def create
    params.require(:video).permit!

    video = Video.new(params[:video])
    if video.save
      render json: VideoSerializer.new(video).as_json(root: false)
    else
      render json: video.errors, status: 406
    end
  end

  def update
    params.require(:id)
    params.require(:video).permit!

    video = Video.find(params[:id])
    if video.update_attributes(params[:video])
      render json: VideoSerializer.new(video).as_json(root: false)
    else
      render json: video.errors, status: 406
    end
  end

  def destroy
    params.require(:id)

    video = Video.find(params[:id])
    video.destroy

    render nothing: true
  end
  
  
end
