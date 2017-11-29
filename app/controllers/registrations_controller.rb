class RegistrationsController < Devise::RegistrationsController

  def respond_with(resource, opts = {})
    render json: resource, include: :company
  end

end
