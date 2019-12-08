class CompaniesController < ApplicationController
  def index
    self.source_ids
    @src_controller == "associates"
    redirect_to company_users_all_path(current_user)
  end

  def show
    self.source_ids
    @company = Company.find(company_params[:id])
    @column_headings = @company.account_headings
    @tiling_elements = @company.packages
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
    @company = Company.find(company_params[:company_id])
    @users = @company.users
      @title = "All of #{@company.name}'s Associates"
  end
  
  

private

  def company_params
    params.permit(:id, :user_id, :company_id)
  end
end
