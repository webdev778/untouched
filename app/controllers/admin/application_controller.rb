# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authentication
    def authentication
      unless Rails.env.development? or Rails.env.test?
        authenticate_or_request_with_http_basic('Admin') do |name, password|
          if name == ENV['BASIC_ADMIN_USERNAME'] && password == ENV['BASIC_ADMIN_PASSWORD']
            @role = "admin"
            return true
          elsif name == ENV['BASIC_USER_USERNAME1'] && password == ENV['BASIC_USER_PASSWORD1']
            @role = "user"
            return true
          else
            return false
          end
        end
      else
        @role = "admin"
      end
    end
  end
end
