class AccountsController < ApplicationController
  def new
    @title = "Add New Account:"
    @subject = Account.new
    @subject.build_company
    @child_class_attribute = Package.status
    @child_collection_attribute = :status
    3.times {@subject.packages.build}
  end

  
  def index
    
    raise params.inspect
  end

  def create
    # raise params.inspect
    if !Account.find_by(name: account_params[:name], company_id: account_params[:company_id])
      @account = Account.new(account_params)
      @company = Company.find(account_params[:company_id])
      @company.accounts << @account
      if @account.save
        
        # raise params.inspect
        redirect_to root_path
      else
        raise params.inspect
        redirect_to root_path
      end
    else
      @account = Account.new(account_params)
      @company = Company.find(account_params[:company_id])
      @account= @company.accounts.find_by(:name=> account_params[:name])
      @account.save 
    # raise params.inspect
      redirect_to root_path
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