module Admin
  class DevelopmentsController < Admin::ApplicationController
    def editor
      @development = Development.find(params[:id])
    end

    def records_per_page
      params[:per_page] || 1000
    end

    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Development.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Development.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
