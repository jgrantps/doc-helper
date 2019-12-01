class AssociatesController < ApplicationController
  def index
    @role = associates_params[:role]
    @user = User.find(associates_params[:user_id])
    @associates = @user.associated_users(@role)
    
  end

  def show
  end
  
  private

  def associates_params
    params.permit(:role, :user_id)  
  end
end
