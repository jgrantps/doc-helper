module AssociatesHelper

  def user_count(role)
    link_to user_associates_path(current_user.id, {:role => role}), class: "flex justify-between item-center px-3 py-1 text-sm font-medium text-gray-700 rounded-lg hover:bg-gray-200" do
      concat tag.span role.titleize.pluralize, class: ["text-xs", "font-semibold", "text-gray-700"] 
      concat tag.span current_user.associates.specific_for(current_user, role).count, class: ["text-xs", "font-semibold", "text-gray-700", "flex"]
    end       
  end
  
end

