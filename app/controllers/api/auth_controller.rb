class API::AuthController < API::BaseController
  def is_signed_in?
    if user_signed_in?
      render :json => current_user.to_json(include: :company)
    else
      render :json => nil
    end
  end
end
