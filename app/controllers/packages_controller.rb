class PackagesController < ApplicationController
    def index
        @package = Package.find_by(packages_params[:id])
        @title = @package.name
    end
    
    def show
        @package = Package.find_by(packages_params[:id])
      
    end


private

    def packages_params
        params.permit(:id, :user_id)    
    end
end
