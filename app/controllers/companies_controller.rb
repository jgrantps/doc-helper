class CompaniesController < ApplicationController

  def index

  end

  def show
   @company = Company.find(company_params[:id])
   @title = @company.name
   
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  # ---- actions to filter sorted users based on current_user ----
  def all 
    @users = current_user.all_associated_users
      @title = "All of #{current_user.name}'s Colleagues"
  end
  
  def managers 
    
    @title = "#{current_user.name}'s Manager Colleagues"
    if params[:company_id]
      @company = Company.find(company_params[:company_id])
    end  
    byebug
    

  end

  def admins
    @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Admin Colleagues"
  end

  def contacts
    @users = current_user.all_associated_users
      @title = "#{current_user.name}'s Contacts"
  end

private

  def company_params
    params.permit(:id, :user_id, :company_id)
  end
end
