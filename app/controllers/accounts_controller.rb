class AccountsController < ApplicationController
  
  def new
    @route_path = user_accounts_path(current_user.id)
    @title = "Add New Account:"
    @subject = Account.new
    @subject.build_company
    3.times {@subject.packages.build}
    @child_class_attribute = Package.status
    @child_collection_attribute = :status
  end

  
  def index
  end

  def create
    
    if !Account.find_by(name: account_params[:name], company_id: account_params[:company_id])
      @account = Account.new(account_params) 
      if !@account.company     
        @company = Company.find(account_params[:company_id])
        @company.accounts << @account
      end

      if @account.save         
        redirect_to user_company_path(current_user, @account.company.id)
      else
        redirect_to root_path
      end

    else
      @account = Account.new(account_params)
      @company = Company.find(account_params[:company_id])
      @pre_account= @company.accounts.find_by(:name=> account_params[:name])
      @pre_account.packages<<@account.packages
      @account = @pre_account     
      @account.save 
      
      redirect_to user_company_path(current_user, @company)
    end
  end
  
  def show
    raise params.inspect
    if account_params[:associate_id]
      @associate = User.find(account_params[:associate_id])
    end
    @account = Account.find(account_params[:id])
  end


  private

  def account_params 
    params.require(:account).permit(:user_id, :id, :associate_id, :name, :company_id, company_attributes: [:name], packages_attributes: [:name, :status])
  end
  
end