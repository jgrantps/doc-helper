class ConfirmationsController < Devise::ConfirmationsController
  private
    def after_confirmation_path_for(resource_name, resource)
        sign_in(resource)
        dashboard_index_path
    end
end
