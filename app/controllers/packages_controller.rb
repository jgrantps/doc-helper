class PackagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @title = "Add New Package"
    @subject = Package.new
    @subject.build_account
    3.times {@subject.package_comments.build}
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def packages_params 
    params.require(:package).permit(:user_id, :id, :associate_id, :name, :company_id, company_attributes: [:name], packages_attributes: [:name, :status])
  end
end
