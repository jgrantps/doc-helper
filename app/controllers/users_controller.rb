class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  def index
  end

  
  def show
    @users = User.all
    @account=Account.last
    @account_name = @account.name
    @company = @account.name
    @packages = Package.all
    @contributors = @account.users
  end
  
  def update
  end
  
  def edit
  end
end
