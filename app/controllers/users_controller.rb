class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  def index
  end

  
  def show
    @user = current_user
    @account=Account.last
    @account_name = @account.name
    
    @company = @account.name
    @packages = current_user.owned_packages
    @contributors = @account.users
    @status_keys = Package.status
    
  end
  
  def update
  end
  
  def edit
  end
end
