class AssociatesController < ApplicationController
  def index
    @user = User.find(associates_params[:user_id])
    @associates = @user.asssociates.distinct
    
  end

  def show
  end
  
  private

  def associates_params
    params.permit(:role, :user_id)  
  end
end
