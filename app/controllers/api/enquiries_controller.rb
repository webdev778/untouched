class API::EnquiriesController < API::BaseController

  def create
    enquiry = Enquiry.new(enquiry_params)

    if enquiry.save
      render json: enquiry.to_json, status: 200
    else
      render json: enquiry.errors.to_json, status: 406
    end
  end

  protected

  def enquiry_params
    params[:enquiry].permit!
  end

end

