class AccountsController < ApplicationController
  def new
    @title = "Add New Account:"
    @account = Account.new
    @account.build_company
    3.times {@account.packages.build}
  end

  def create
    @account = Account.new(account_params)
    byebug
  end
  
  def show
    @account = Account.find(account_params_show[:id])
  end


  private

  def account_params_show 
    params.permit(:user_id, :id)
  end


  
end