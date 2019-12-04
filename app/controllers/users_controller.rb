class UsersController < ApplicationController

  before_action :authorize_admin, except: [:index, :show, :filtered, :managers, :contacts, :admins, :all]
 
  def index
      @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Packages"
  end

  
  def show
    self.source_ids
    if signed_in?  
      @tiling_elements = current_user.packages
      @title = "#{current_user.name}'s Packages"
      @column_headings = Package.status
    else
      redirect_to root_path  
    end      
  end
  
  def update
  end
  
  def edit
  end

end
