module TilesHelper

  ## Control contents inside of the columns tiles when called by the CANVAS method.
  def tiles(tiling_elements:, sorting_condition:)  
    case strong_params[:controller]
      
    when "companies"
      account = @company.accounts.find_by(name: sorting_condition)
      filtered_tile_collection = tiling_elements.specific(account)
      render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
      locals: {variable: ""}

    when "users" 
      filtered_tile_collection = tiling_elements.where(:status => sorting_condition).distinct
      render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
      locals: {variable: ""}   

    when "associates"
      associates = @associates
      filtered_tile_collection = tiling_elements.merge(Company.where(name: sorting_condition)).distinct
      render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
      locals: {variable: sorting_condition}        
    end    
  end
  


  ## Displays package description
  def tile_title(element:)
    case element.class.name
    when "User" 
      output = element.name
    when "Company" || "Account"
      output = element.name
    when "Package"
      output = element.name
    end
    
    content_tag(:h2, element, :class => "text-sm font-medium font-bold text-gray-900") do
      output.upcase
    end
  end


  ## shows comments -if any- for packages.  Shows associate's position in the company for users/associates.
  def tile_contents(element:, variable:)
    content_tag(:p, element, :class => "text-sm font-medium text-gray-900 leading-snug") do
      case element.class.name      
      when "Associate"          
        user_role(element: element, company_name: variable)
      when "User"
        user_role(element: element, company_name: variable)          
      when "Package"
        content_tag(:h2, element, :class => "text-sm font-medium font-bold text-gray-900") do
          package_comments(element: element, company_name: variable)
        end
      when "Account"
        output = element.account.name
      when "Company"
        ouptut = element.status
      end
    end
  end
  
  def user_role(element:, company_name:)
    company = Company.find_by(:name => company_name)
    role = Position.where(:user_id => element).where(:company_id => company).first.title
  end
  
  def package_comments(element:, company_name:)
    package = element 
    package.package_comments.each do |comment|
      commentor = User.find(comment.user_id)     
      concat "#{comment.comment}  |  #{commentor.name}" 
      concat tag.br 
    end   
  end
  
  def tile_link(element:)
    link_to new_package_package_comment_path(element) do
      content_tag(:div, element, :class => "text-sm text-gray-600") do
        "post a comment"
      end
    end
  end
  
  def tile_flag(element:)
    # raise params.inspect
    case element.class.name
      
      when "Associate"
        output = element.name
      when "User"
        output = element.name
      when "Package"
        if strong_params[:controller] == "companies"
          output = element.status
        else
          output = element.account.name
        end
      when "Account"
        output = element.account.name
      when "Company"
        ouptut = element.status
    end
    
    content_tag(:span, element, :class => "ml-1 py-1 text-sm font-medium leading-tight text-teal-900") do            
      output.titleize 
    end
  end  


  
  ## methods for controlling avatar appearances in tiles.  
  def tile_avatar(element: )
    content_tag(:div, class: "ml-6 flex items-center" ) do
       avatar_lineup(person: element)
    end
  end

  def avatar_lineup(person:)
    if person.class.name == "User" || person.class.name == "Associate"
      span(element: person)
    else 
      person.users.distinct.each.first(3) do |user|
        span(element: user)
      end
    end
  end

  def span(element: )
    content_tag("span", class: "-ml-2 rounded-full border-2 border-white") do 
     pic_tag(user: element) 
    end
  end

  def pic_tag(user:)    
     tag("img", class: "h-6 w-6 rounded-full object-cover", :src => user.url, :alt => "profile photo")
  end

end
