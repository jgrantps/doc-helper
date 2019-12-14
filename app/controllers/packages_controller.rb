class PackagesController < ApplicationController
  def index
  end

  def show
  end

  def new
      @route_path = account_packages_path(route_params[:account_id])
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
      3.times {@subject.package_comments.build(:user_id => current_user.id)}      
    end

    
    
    def create
      if !packages_params[:name].empty?
        
        @account = Account.find(route_params[:account_id])
        pp = packages_params
        pc = pp[:package_comments_attributes]
        pc.select do |key, hash|
          hash["user_id"] = current_user.id
        end
        pp.merge(pc)
        
       @package = Package.new(pp)
      @package.account = @account
      
      if @package.save
        
        redirect_to user_company_path(current_user, @account.company)
      else
        redirect_to root_path
      end
    else
      @account = Account.find(route_params[:account_id])
      redirect_to user_company_path(current_user, @account.company)
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
    params.require(:package).permit(:user_id, :status, :account_id, :id, :associate_id, :name, :company_id, account_attributes: [:name],
     packages_attributes: [:user_id, :name, :status], package_comments_attributes: [:comment, :user_id])
    #.merge(package_comments_attributes: [:comment, user_id: current_user.id])
  end

  def adjusted_params
    packages_params[:package_comments_attributes].values.map {|v| v.to_h.merge(user_id: "7")}  
  end

  def route_params
    params.permit(:account_id)  
  end
end
