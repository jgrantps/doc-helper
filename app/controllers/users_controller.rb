class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show, :filtered, :managers, :contacts, :admins, :all]
 
  def index
      @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Packages"
  end

  
  def show
    if signed_in?   
     
      @title = "#{current_user.name}'s Packages"
    else
      redirect_to root_path  
    end      
  end
  
  def update
  end
  
  def edit
  end

  # ---- actions to filter sorted users based on current_user ----
  def all 
    @users = current_user.all_associated_users
      @title = "All of #{current_user.name}'s Colleagues"
  end
  
  def managers 
    @users = current_user.all_associated_users
    @title = "#{current_user.name}'s Manager Colleagues"
    if params[:company_id]
      @company = Company.find(params[:company_id])
    end  
    

  end

  def admins
    @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Admin Colleagues"
  end

  def contacts
    @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Contacts"
  end


end
