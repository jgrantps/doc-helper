class PackagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @title = "Add New Package"
    @package = Package.new
    @package.build_account
    3.times {@package.package_comments.build}
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end
end
