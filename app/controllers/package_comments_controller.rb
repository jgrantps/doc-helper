class PackageCommentsController < ApplicationController
  def index
  end
  
  def new
    package = Package.find(packagecomments_package[:package_id])
    @subject = PackageComment.new(:user_id => current_user.id, :package_id => packagecomments_package[:package_id])
    @title = "Comment for #{package.account.name} > #{package.name}"
    @path = new_package_package_comment_path(packagecomments_package[:package_id])
  end

  def create
    if !packagecomments_comment[:comment].blank?
      package = Package.find(packagecomments_package[:package_id])
      new_comment = PackageComment.new(:user_id => current_user.id, :package_id => packagecomments_package[:package_id], :comment => packagecomments_comment[:comment])
      
      if new_comment.save
        package.package_comments << new_comment
        redirect_to user_company_path(current_user, package.company)
      end 

    else
      package = Package.find(packagecomments_package[:package_id])
      redirect_to user_company_path(current_user, package.company)
    end
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

  def packagecomments_comment
    params.require(:package_comment).permit(:comment)
    
  end

  def packagecomments_package
    params.permit(:package_id)
  end

end
