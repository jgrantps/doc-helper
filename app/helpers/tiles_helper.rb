module TilesHelper
#logic to control contents inside of the columns tiles IF called by the CANVAS method.
  def tiles(tiling_elements:, sorting_condition:)
    
    case @src_controller 
    when "companies"
      account = @company.accounts.find_by(name: sorting_condition)
      filtered_tile_collection = tiling_elements.specific(account)

      render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
      locals: {:indexes => "indexes", :account => "account", :status => "status",:name => "name", :company => "company", :users => "users"}
      # locals: {:title => tile_title, :contents => tile_contents, :link => tile_link,:avatar => tile_avatar, :flag => tile_flag }

    when "users" || "associates"
      filtered_tile_collection = tiling_elements.where(:status => sorting_condition)
      
      render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
      locals: {:indexes => "indexes", :account => "account", :status => "status",:name => "name", :users => "users"}
    end

  end

  
  def tile_title(element)
     case element.class.name
      when "User" || "Company" || "Account"
        output = element.name
      when "Package"
        output = element.company.name
      end
    
    content_tag(:h2, element, :class => "text-sm font-medium font-bold text-gray-900") do
      output.upcase
    end
  end
  
  def tile_contents(element)
    content_tag(:p, element, :class => "text-sm font-medium text-gray-900 leading-snug") do
      element.name
    end
  end

  # def tile_avatar(element)
  #   capture do
  #     content_tag(:div, element, :class => "ml-6 flex items-center" ) do
  #       element.users.distinct.each.first(3) do |user|
  #        content_tag(:span, element, :class =>"-ml-2 rounded-full border-2 border-white") do
  #           content_tag(:img, element, :class => "h-6 w-6 rounded-full object-cover", :src => user.url, :alt => "profile photo"))
  #        end
  #     end
  #   end
  # end

  


  
  def tile_link(element)
    link_to package_package_comments_path(element) do
      content_tag(:div, element, :class => "text-sm text-gray-600") do
        "post a comment"
      end
    end
  end

  def tile_flag(element)

    if element.status?
     output = element.status
    else 
      output = element.name
    end

    content_tag(:span, element, :class => "ml-1 py-1 text-sm font-medium leading-tight text-teal-900") do            
      output.titleize 
    end
  end

end
