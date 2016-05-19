module Admin
  class UnitViewsController < Admin::ApplicationController
    def index
      @unit = Unit.find(params[:unit_id])
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   DevelopmentPhoto.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
