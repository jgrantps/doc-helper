class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  def index
      redirect_to new_user_session_path  
  end

  
  def show
    if signed_in?   
      @packages = current_user.packages
      @status_keys = Package.status
    else
      redirect_to root_path  
    end
      
  end
  
  def update
  end
  
  def edit
  end
end
