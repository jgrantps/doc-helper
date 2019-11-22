class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :associated_users, :companies, :invitee_fields, :resource_name, :resource, :devise_mapping, :resource_class, :admins_count, :managers_count, :contacts_count, :all_count
  
  
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

   #=> filtering methods for views and partials
   def associated_users
     if self.admin?
       User.all
     else
       self.companies.map {|company| company.users}.flatten.uniq
     end
   end

   def admins_count(users)
    # users.count{|u| u.role=="admin"}
    puts users
  end
  
  def managers_count(users)
    users.count{|u| u.role=="manager"}
  end
  
  def contacts_count(users)
    users.count{|u| u.role=="contact"}
  end

  def all_count(users)
    users.all.count 
  end
 
  def associated_users
    case current_user.role
      when "admin"
        self.companies.map {|company| company.users}.flatten.uniq
      when "contact"
        self.companies.map {|company| company.users}.flatten.uniq.count{|u| u.role=="contact"}
      when "manager"
        self.companies.map {|company| company.users}.flatten.uniq.count{|u| u.role=="manager"}
    end
  end
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :username, :email, :role, :company])
  end

end
