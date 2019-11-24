class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :company_name, :user_role_types, :all_users, :current_packages,:package_status, :associated_users, :resource, :resource_name, :devise_mapping
  
  def company_name
    return "#{company.name}"
  end


  def all_users
    User.all
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
