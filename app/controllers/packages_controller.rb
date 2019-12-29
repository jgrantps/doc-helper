class PackagesController < ApplicationController
  layout "dashboard"
  
  def new
    
    @route_path = account_packages_path(route_params[:account_id])
    @nested_route_object = Account.find(route_params[:account_id])     
    @title = "New Package For #{@nested_route_object.kompany.name} >> #{@nested_route_object.name}"    
    @subject = @nested_route_object.packages.new
    @subject_class_attribute = Package.status
    @subject_collection_attribute = :status
    3.times {@subject.package_comments.build}      
  end
  
  def create
    @account = Account.find(route_params[:parent_id])
    @subject = @account.packages.new(packages_params)  
   
    if @subject.save 
      redirect_to user_company_path(current_user, @account.company)      
    else
      3.times {@subject.package_comments.build}      
      @route_path = account_packages_path(route_params[:parent_id])
      @title = "New Package For #{@account.kompany.name} >> #{@account.name}" 
      @subject_class_attribute = Package.status
      @subject_collection_attribute = :status
      render :new
    end
  end 
  
  def index
  end

  def show
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def packages_params 
    main_params = params.require(:package).permit(:user_id, :status, :account_id, :id, :associate_id, :name, :company_id, account_attributes: [:name], packages_attributes: [:user_id, :name, :status], package_comments_attributes: [:comment, :user_id])

    comment_attributes = main_params[:package_comments_attributes]
    comment_attributes.each do |key, hash|
      hash["user_id"] = current_user.id
    end

    main_params
  end

  def route_params
    params.permit(:account_id, :parent_id)  
  end
end
