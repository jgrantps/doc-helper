class AccountsController < ApplicationController
  protect_from_forgery :except => :create 
  layout "dashboard"
  
  def new
    @route_path = user_accounts_path(current_user.id)
    @title = "Add New Account:"
    @subject = Account.new
    @subject.build_company
    3.times {@subject.packages.build}
    @child_class_attribute = Package.status
    @child_collection_attribute = :status
  end
  
  
  def create
    # ap = account_params
    # cp = ap[:company_attributes]
    # # raise "inside create".inspect
    # if !!cp
    #   cp[:user_id] = current_user.id
    #   ap.merge(cp)
    # end
    
    
    
    
    
    @subject = Account.new(account_params) 
    @company = @subject.company
    
    if @subject.save
      raise "saved!".inspect
      redirect_to user_company_path(current_user, @company)
    else
      3.times {@subject.packages.build}
      @route_path = user_accounts_path(current_user.id)
      @title = "Add New Account:"
      @child_class_attribute = Package.status
      @subject.build_company
      @child_collection_attribute = :status
      render :new
    end





    # if !Account.find_by(name: account_params[:name], company_id: account_params[:company_id])
    #   @account = Account.new(account_params) 
    #   if !@account.company     
    #     @company = Company.find(account_params[:company_id])
    #     @company.accounts << @account
    #   end
      
    #   if @account.save         
    #     @account.company.add_creator(creator: current_user)
    #     redirect_to user_company_path(current_user, @account.company.id)
    #   else
    #     redirect_to root_path
    #   end
      
    # else
    #   @account = Account.new(account_params)
    #   @company = Company.find(account_params[:company_id])
    #   @pre_account= @company.accounts.find_by(:name=> account_params[:name])
    #   @pre_account.packages<<@account.packages
    #   @account = @pre_account     
    #   @account.save 
      
    #   redirect_to user_company_path(current_user, @company)
    # end


  end

  def show
    if account_params[:associate_id]
      @associate = User.find(account_params[:associate_id])
    end
    @account = Account.find(account_params[:id])
  end
  
  def index
  end

  
  
  private

  def account_params 
    # params.require(:account).permit(:user_id, :id, :associate_id, :name, :company_id, company_attributes: [:name], packages_attributes: [:name, :status])
    main_params = params.require(:account).permit(:user_id, :id, :associate_id, :name, :company_id, company_attributes: [:name], packages_attributes: [:name, :status])
    company_attributes = main_params[:company_attributes]
    if !!company_attributes
      company_attributes[:user_id] = current_user.id
    end
    main_params
  end
  
end