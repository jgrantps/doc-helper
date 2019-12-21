class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, except: [:index, :show, :filtered, :managers, :contacts, :admins, :all]
 
  def index
      @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Packages"

  end

  
  def show
  
    if signed_in?  
      @column_headings = Package.status
      @tiling_elements = current_user.packages
      @title = "#{current_user.name}'s Packages"
    else
      redirect_to root_path  
    end      
  end
  
  def update
  end
  
  def edit
  end

  private

  def users_params
    params.permit(:role, :controller,:action, :user_id)
  end


end
