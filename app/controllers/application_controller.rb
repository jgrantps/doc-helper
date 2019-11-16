class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :invitee_fields, :resource_name, :resource, :devise_mapping, :resource_class, :invite_key_fields

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

  def invite_key_fields
    [:name, :username, :email, :role]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :username, :email, :role, :company])
  end

end
