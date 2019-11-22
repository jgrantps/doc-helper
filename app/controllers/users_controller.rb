class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  def index
      redirect_to new_user_session_path  
  end

  
  def show
    if !signed_in?
      @account=Account.last
      @account_name = @account.name
      @company = @account.name
      @packages = current_user.packages
      @contributors = @account.users
      @status_keys = Package.status
    else
      redirect_to new_user_sessions_path  
    end
      
  end
  
  def update
  end
  
  def edit
  end
end
