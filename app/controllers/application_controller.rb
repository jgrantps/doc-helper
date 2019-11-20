class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :companies, :propername, :invitee_fields, :resource_name, :resource, :devise_mapping, :resource_class
  
  def propername(input)
    ary = input.split("_" || " ")
    upcase = ary.map {|i| i.capitalize }
    title = upcase.join(" ")
    title
  end

  def companies
    if current_user.admin?
      Company.all
    else
      current_user.companies
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
