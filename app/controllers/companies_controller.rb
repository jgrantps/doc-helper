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

private

def company_params
  params.permit(:id, :user_id)
end

end
