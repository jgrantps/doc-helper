module AssociatesHelper

  def associates_filter
    content_tag(:div, class: "mt-2") do
      current_user.class.roles.keys.each do |role| 
       concat associates_link(role)
      end
    end  
  end
  
  def associates_link(var)
    link_to user_associates_path(current_user.id, {:role => var}), class: "flex justify-between item-center px-3 py-1 text-sm font-medium text-gray-700 rounded-lg hover:bg-gray-200" do
      associate_title(var) + associate_count(var)  
    end
  end

  def associate_title(role)
    concat tag.span role.titleize.pluralize, class: ["text-xs", "font-semibold", "text-gray-700"] 
  end
  
  def associate_count(role)
    concat tag.span current_user.associates.specific_for(current_user, role).count, class: ["text-xs", "font-semibold", "text-gray-700", "flex"] 
  end

end

