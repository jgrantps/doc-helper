class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to user_path(current_user)
    else
      redirect_to new_user_session_path
    end    
  end
end
