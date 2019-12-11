module TilesHelper
#logic to control contents inside of the columns tiles IF called by the CANVAS method.
  def tiles(tiling_elements:, sorting_condition:)
    
    
    case strong_params[:controller]
      
      when "companies"
        account = @company.accounts.find_by(name: sorting_condition)
        filtered_tile_collection = tiling_elements.specific(account)

        render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
        locals: {:indexes => "indexes", :account => "account", :status => "status",:name => "name", :company => "company", :users => "users"}
        

      when "users" 
        filtered_tile_collection = tiling_elements.where(:status => sorting_condition)
        
        render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
        locals: {:indexes => "indexes", :account => "account", :status => "status",:name => "name", :users => "users"}
        
      when "associates"
        
        associates = @associates
        filtered_tile_collection = tiling_elements.merge(Company.where(name: sorting_condition))
        
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

  
  
  
  
  
  def tile_link(element)
    link_to package_package_comments_path(element) do
      content_tag(:div, element, :class => "text-sm text-gray-600") do
        "post a comment"
      end
    end
  end
  
  def tile_flag(element)
    # raise params.inspect
    case element.class.name
      when "Associate"
        output = element.name
      when "User"
        output = element.name
      when "Package"
        output = element.status
      when "Account"
        output = element.account.name
      when "Company"
        ouptut = element.status
    end
    
    content_tag(:span, element, :class => "ml-1 py-1 text-sm font-medium leading-tight text-teal-900") do            
      output.titleize 
    end
  end
  
  
  
  
  
  
  def tile_avatar(element)
    content_tag(:div, class: "ml-6 flex items-center" ) do
       avatar_lineup(element)
    end
  end

  def avatar_lineup(element)
    if element.class.name == "User" || element.class.name == "Associate"
      span(element)
    else 
      element.users.distinct.each.first(3) do |user|
        span(user)
      end
    end
  end

  def span(user)
     content_tag("span", class: "-ml-2 rounded-full border-2 border-white") do 
     pic_tag(user) 
    end
  end

  def pic_tag(user)
    
     tag("img", class: "h-6 w-6 rounded-full object-cover", :src => user.url, :alt => "profile photo")
  end

  private

  def strong_params
    params.permit(:controller, :action, :id, :company_id, :user_id, :role, :account_id)
  end

end
