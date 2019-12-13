class PackageCommentsController < ApplicationController
  def index
  end
  
  def new
    # raise params.inspect
    @subject = PackageComment.new(:user_id => current_user.id, :package_id => packagecomments_params[:package_id])
    @title = "here we are"
    @path = new_package_package_comment_path(packagecomments_params[:package_id])
    
    # raise params.inspect


   
  end

  def create
    raise params.inspect
  end

  def show
  end

  def update
  end

  def delete
  end

  def edit
  end

  private

  def packagecomments_params
    params.permit(:package_id)
  end
end
