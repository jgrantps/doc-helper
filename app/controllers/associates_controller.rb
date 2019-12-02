class AssociatesController < ApplicationController
  def index
    if associates_params[:user_id]
      @role = associates_params[:role]  
      @user = User.find(associates_params[:user_id])
      @associates = @user.associated_users(@role)
    else
      @role = associates_params[:role]
      @company = Company.find(associates_params[:company_id])
      @associates = @company.associated_users(@role)
      
    end
  end
  
  def show
    @associate = User.find(associates_params[:id])
    if associates_params[:company_id]
      @company = Company.find(associates_params[:company_id])
    end
  end
  
  private

  def associates_params
    params.permit(:role,:id, :user_id, :company_id)  
  end
  
 
  
end
