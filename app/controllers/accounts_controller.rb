class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.build_company
  end

  def create
    byebug
  end

  private

  def account_params
      params.require(:account).permit(:name, :company_id, company_attributes([:name]))
  end
  
end