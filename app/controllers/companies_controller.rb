class CompaniesController < ApplicationController
  def index

    redirect_to company_users_all_path(current_user)
  end

  def show
    @company = Company.find(company_params[:id])
    if current_user.companies.include?(@company)
      self.source_ids
      @column_headings = @company.account_headings
      @tiling_elements = @company.packages
      @title = @company.name 
    else
      redirect_to root_path 
    end


   
  end

  def new
    @route_path = user_companies_path(current_user.id)
    @title = "Create a New Company"
    @subject = Company.new
    # @subject.build_positions
    3.times {@subject.accounts.build}
    
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
