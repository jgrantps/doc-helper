class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :specified_associates, :user_role_types, :current_packages,:package_status, :associated_users, :resource, :resource_name, :devise_mapping
  
  
  
  #=> returns a "controller#action"-type string for the accessed route.  Used for conditional logic in helper methods.
  def source_ids
    @src_controller = "#{self.controller_name}"  
    @src_action = "#{self.action_name}"  
    @src = "#{@src_controller}##{@src_action}"    
  end

  def specified_associates(rrole)
    self.associates.where(role: rrole).where.not(id: self).distinct
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
    root_path
  end

   
  
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :username, :email, :role, :company])
  end

end
