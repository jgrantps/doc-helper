class PackageCommentsController < ApplicationController
  def index
  end
  
  def new
    @subject = PackageComment.new
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
