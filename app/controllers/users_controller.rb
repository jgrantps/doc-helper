class UsersController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  def index
    raise params.inspect
  end
  
  def show
    if current_user.admin?
      @test = "Hello world!, I'm admin?" 
    else
      @test = "not admin!"
    end
  end
  
  def update
  end
  
  def edit
  end
end
