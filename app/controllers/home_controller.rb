class HomeController < ApplicationController
  layout "application"
  def index
    #  raise "homecontroller".inspect
    if signed_in?
      redirect_to user_path(current_user)
    else
      render "devise/sessions/new.html.erb"
    end   
  end
end
