class UsersController < ApplicationController
  before_filter :authorize_admin, except: [:index, :show]
  def index
  end

  def show
  end

  def update
  end

  def edit
  end
end
