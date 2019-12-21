class AssociatesController < ApplicationController
  layout "dashboard"
  def new
  @route_path = user_accounts_path(current_user.id)
  @title = "Add New User:"
   @subject = User.new
  # @subject.positions.build
    p = @subject.positions.build
    p.build_company
    
 
  end

  def index
    
    @role = associates_params[:role]
    
    @associates = current_user.specified_associates(rle: @role)
    @tiling_elements = @associates
    @column_headings = current_user.company_names
    @title = "#{current_user.name}'s Associates"
    
  end
  
  def show
    @associate = User.find(associates_params[:id])
    if associates_params[:company_id]
      @company = Company.find(associates_params[:company_id])
    end
  end
  
  private

  def associates_params
    params.permit(:role, :id, :user_id, :company_id)  
  end
  
 
  
end
