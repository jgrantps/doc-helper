module AssociatesHelper

  def associates_sidebar_menu
    content_tag(:div, class: "mt-2") do
      current_user.class.roles.keys.each do |role| 
       concat associates_link(role)
      end
      concat new_associate if current_user.admin? 
    end  
  end
  
  def associates_link(var)
    link_to user_associates_path(current_user.id, {:role => var}), class: "flex justify-between item-center px-3 py-1 text-sm font-medium text-gray-700 rounded-lg hover:bg-gray-200" do
      associate_title(var) + associate_count(var)  
    end
  end

  def associate_title(role)
   tag.span role.titleize.pluralize, class: ["text-xs", "font-semibold", "text-gray-700"] 
  end
  
  def associate_count(role)
   tag.span current_user.specified_associates(rle: role).count, class: ["text-xs", "font-semibold", "text-gray-700"] 
  end

  def new_associate
    content_tag(:button, class: "mt-3 py-2 px-3 flex items-center text-sm font-medium text-gray-600 border border-gray-300 rounded hover:bg-gray-200") do 
      cross + 
      add_associate_link 
    end
  end

  def add_associate_link  
    content_tag(:span, class: "ml-2") do
      concat link_to "New Associate", new_user_associate_path(current_user.id)
    end
  end
    

end

