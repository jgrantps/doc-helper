class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :iteration, :user_role_types, :current_packages,:package_status, :associated_users, :resource, :resource_name, :devise_mapping
  layout "dashboard"
  
  def iteration_switch
    company_reference = []
    user_reference = []
    account_reference = []
    if params.include?(:company_id)
      c = Company.find(:company_id)
      
    elsif params.include?(:user_id)
    end

  end
  
  def user_role_types
    return User.roles.keys
  end

  def package_status
   return Package.status
  end

  def current_packages
    if current_user.admin?
      Package.all
    else
      current_user.packages
    end
  end
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  def after_invite_path_for(resource)
    users_path
  end

   
  
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :username, :email, :role, :company])
  end

end
