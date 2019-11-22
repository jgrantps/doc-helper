class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_packages,:package_status, :associated_users, :companies, :invitee_fields, :resource_name, :resource, :devise_mapping, :resource_class, :admins_count, :managers_count, :contacts_count, :all_count
  
  
  def companies
    if current_user.admin?
      Company.all
    else
      current_user.companies
    end
  end

  def package_status
   return Package.status
  end

  def current_packages
    current_user.packages
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
