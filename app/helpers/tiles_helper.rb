module TilesHelper

  ## Control contents inside of the columns tiles when called by the CANVAS method.
  def tiles(tiling_elements:, sorting_condition:)  
    case strong_params[:controller]
    
    when "companies"
      account = @company.accounts.find_by(name: sorting_condition)
      filtered_tile_collection = tiling_elements.specific(account)
      filtered_tile_collection.each {|element| concat tile_framework(element: element, variable: nil)}
      
    when "users" 
      filtered_tile_collection = tiling_elements.where(:status => sorting_condition).distinct
      filtered_tile_collection.each {|element| concat tile_framework(element: element, variable: nil)}
      
    when "associates"
      associates = @associates
      filtered_tile_collection = tiling_elements.merge(Company.where(name: sorting_condition)).distinct
      filtered_tile_collection.each {|element| concat tile_framework(element: element, variable: sorting_condition)}        
    end    
  end
  

def tile_framework(element:, variable:)
  content_tag("li", class: "mt-3") do
    content_tag("div", class: "block p-5 bg-white rounded-lg shadow" ) do
      concat upper_tile_block(element: element)
      concat contents_and_avatar(element: element, variable: variable)
      concat tile_link(element: element) if strong_params[:controller] != "associates"
    end
  end
end


def upper_tile_block(element:)
  content_tag("div", class: "flex justify-between py-2 mb-4", id: "tile_title") do
    concat tile_title(element: element)
    concat tile_flag(element: element)
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

  def tile_flag(element:)
    tag.div do
      content_tag("span", class: "from-helper!! px-2 inline-flex items-center bg-teal-100 rounded") do
        concat content_tag("svg", tag("circle", cx: "4", cy: "4", r:"3"), class: "from-helper!!! block h-2 w-2 m-2 text-teal-500", viewBox:"0 0 8 8", fill:"currentColor")
        concat tile_flag_content(element: element)
      end
    end
  end

    def tile_flag_content(element:)
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
          output = element.status
      end
      
      content_tag(:span, element, :class => "ml-1 py-1 text-sm font-medium leading-tight text-teal-900") do            
        output.titleize 
      end
    end  

  def contents_and_avatar(element:, variable:)
    content_tag("div", class: " from-helper! flex justify-between") do
      concat tile_contents(element: element, variable: variable) 
      concat tile_avatar(element: element)
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
        content_tag(:h2, element, :class => "comment-tag text-sm font-medium font-bold text-gray-900") do
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
        concat content_tag(:div, "#{comment.comment}  |  #{commentor.name}", class: "mb-2 border-b-2")  
        concat link_to "DELETE COMMENT", package_package_comment_path(comment.package.id, comment.id), class: "font-xs font-light", method: "DELETE"  if comment.user == current_user
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
        avatar_span(element: person)
      else 
        person.users.distinct.each.first(3) do |user|
          avatar_span(element: user)
        end
      end
    end

      def avatar_span(element: )
        content_tag("span", class: "-ml-2 rounded-full border-2 border-white") do 
        pic_tag(user: element) 
        end
      end

        def pic_tag(user:)    
          tag("img", class: "h-6 w-6 rounded-full object-cover", :src => user.url, :alt => "profile photo")
        end

  def tile_link(element:)
    content_tag("div", class: "flex mt-2 justify-between items-baseline") do
      link_to new_package_package_comment_path(element) do
        content_tag(:div, element, :class => "text-sm text-gray-600") do
          "post a comment"
        end  
      end  
    end  
  end  
end
