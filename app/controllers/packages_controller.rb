class PackagesController < ApplicationController
  def index
  end

  def show
  end

  def new
      #=> reified RESTful parent provided to build @title
      @nested_route_object = Account.find(route_params[:account_id])
   
      #=> For main display in Top Ribbon Bar   
      @title = "New Package For #{@nested_route_object.kompany.name} >> #{@nested_route_object.name}"

      #=> pre-emptive build of main element
      @subject = Package.new
      
      #=> pre-emptive build of parent element
      @subject.build_account

      @subject_class_attribute = Package.status
      @subject_collection_attribute = :status
      
      #=> pre-emptive build of child elements
      3.times {@subject.package_comments.build}

  end

  def create
    @title = "hello there"
    @account = Account.find(route_params[:account_id])
    @package = Package.new(packages_params)
    @package.account = @account
    
    if @package.save
      raise params.inspect
      redirect_to user_company_path(current_user, @account.company)
    else
      redirect_to root_path
    end
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def packages_params 
    params.require(:package).permit(:user_id, :status, :account_id, :id, :associate_id, :name, :company_id, account_attributes: [:name], packages_attributes: [:name, :status])
  end

  def route_params
    params.permit(:account_id)  
  end
end
