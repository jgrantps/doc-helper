class PackageCommentsController < ApplicationController
  def index
  end
  
  def new
    package = Package.find(packagecomments_package[:package_id])
    @subject = PackageComment.new(:user_id => current_user.id, :package_id => packagecomments_package[:package_id])
    @title = "Comment for #{package.account.name} > #{package.name}"
    
    @route_path = package_package_comments_path(packagecomments_package[:package_id])
  end

  def create
    redirect_to root_path if !current_user.packages.include?(Package.find(packagecomments_package[:package_id]))


    # raise params.inspect
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
