class CompaniesController < ApplicationController
  
  def new  
    @route_path = user_companies_path(current_user.id)
    @title = "Create a New Company:"
    @subject = Company.new
    p = @subject.positions.build
    p.build_user
    @subject.accounts.build
    @child_class_attribute = Account.name
  end
  
  def create
    @company = Company.new(new_company_params)
    if @company.save
      @company.add_creator(creator: current_user)
      redirect_to company_path(current_user.id, @company.id)
    end
  end

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
    params.require(:company).permit(:name, accounts_attributes: [:name], positions_attributes: [:title, :current_user => current_user, user_attributes: [:id, :user_id, :name]])
  end
end
