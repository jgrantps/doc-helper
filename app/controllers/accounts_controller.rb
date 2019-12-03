class AccountsController < ApplicationController
  def new
    @title = "Add New Account:"
    @account = Account.new
    @account.build_company
    3.times {@account.packages.build}
  end

  
  def index
    
  end

  def create
    @account = Account.new(account_params)
  end
  
  def show
    if account_params[:associate_id]
    @associate = User.find(account_params[:associate_id])
    end
    @account = Account.find(account_params[:id])
  end


  private

  def account_params 
    params.permit(:user_id, :id, :associate_id)
  end


  
end