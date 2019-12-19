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
    @company = Company.new(new_company_params)
    if @company.save
      redirect_to company_path(current_user.id, @company.id)
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

private

  def company_params
    params.permit(:id, :user_id, :company_id)
  end

  def new_company_params
    params.require(:company).permit(:name, accounts_attributes: [:name])
  end
end
