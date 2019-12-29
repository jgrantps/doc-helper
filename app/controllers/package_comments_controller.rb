class PackageCommentsController < ApplicationController
  layout "dashboard"
  def index
  end
  
  def new
    @parent_package = Package.find(packagecomments_package[:package_id]) if @parent_package.blank?
    @subject = PackageComment.new(:user_id => current_user.id, :package_id => packagecomments_package[:package_id])
    @title = "Comment for #{@parent_package.account.name} > #{@parent_package.name}"
    @route_path = package_package_comments_path(packagecomments_package[:package_id])
  end
  
  def create
    # redirect_to root_path if !current_user.packages.include?(Package.find(packagecomments_package[:package_id]))
    @parent_package = Package.find(packagecomments_package[:package_id])
    @subject = @parent_package.package_comments.build(packagecomments_comment)
    
    if @subject.save
      redirect_to user_company_path(current_user, @parent_package.company)      
    else
      
      @parent_package = Package.find(packagecomments_package[:package_id])
      @title = "Comment for #{@parent_package.account.name} > #{@parent_package.name}"
      # raise params.inspect
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
    comment = PackageComment.find(packagecomments_package[:id])
    comment.delete
    company = Package.find(packagecomments_package[:package_id]).company
    redirect_to user_company_path(current_user.id, company.id)


  end

  def edit
  end

  private

  def packagecomments_comment
    comment_params = params.require(:package_comment).permit(:comment)
    updated_params = comment_params.merge(:user_id => current_user.id)
    return updated_params
    
  end

  def packagecomments_package
    params.permit(:package_id, :id)
  end



end
