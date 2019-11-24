class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show, :filtered]
 
  def index
    
      @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Packages"
  end

  
  def show
    if signed_in?   
      @packages = current_user.packages
      @title = "#{current_user.name}'s Packages"
    else
      redirect_to root_path  
    end      
  end

  def filtered
    byebug
  end

  def index_request
     byebug
  end
  
  def update
  end
  
  def edit
  end
end
