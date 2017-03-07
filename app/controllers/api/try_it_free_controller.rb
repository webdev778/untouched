class API::TryItFreeController < API::BaseController

  def create
    Notifier.try_it_free(try_it_free_params["email"]).deliver_now
    render json: "sucess", status: 200
  end

  protected

  def try_it_free_params
    params.require(:email).permit(:email)
  end

end

