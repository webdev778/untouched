class API::ImagesController < API::BaseController

  def create
    params.require(:image).permit!

    image = Image.new(params[:image])
    if image.save
      render json: ImageSerializer.new(image).as_json(root: false)
    else
      render json: image.errors, status: 406
    end
  end

  def update
    params.require(:id)
    params.require(:image).permit!

    image = Image.find(params[:id])
    if image.update_attributes(params[:image])
      render json: ImageSerializer.new(image).as_json(root: false)
    else
      render json: image.errors, status: 406
    end
  end

  def destroy
    params.require(:id)

    image = Image.find(params[:id])
    image.destroy

    render nothing: true
  end
  
  
end
