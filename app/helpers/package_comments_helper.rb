module PackageCommentsHelper

  def hidden_package_id(instance)
    hidden_field_tag :package_id, strong_params[:package_id]  
  end
end
