class UsersController < ApplicationController

  before_action :authorize_admin, except: [:index, :show, :filtered, :managers, :contacts, :admins, :all]
 
  def index
      @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Packages"
  end

  
  def show
    if signed_in?  
     
      @packages = current_user.packages
      @title = "#{current_user.name}'s Packages"
      @test= "hello world from controller"
      @src = "#{self.controller_name}##{self.action_name}"
    else
      redirect_to root_path  
    end      
  end
  
  def update
  end
  
  def edit
  end

end
