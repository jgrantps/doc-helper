class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.build_company
    3.times {@account.packages.build}
  end

  def create
    @account = Account.new(account_params)
    byebug
  end

  private

  def account_params
      params.require(:account).permit(:name, :company_id, company_attributes: [:name])
  end

end