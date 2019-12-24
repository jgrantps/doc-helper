module ApplicationHelper
  def upper_block
    render partial: "dashboard_elements/upper_block"
  end

  def canvas(column_headings:)
  ## main component of the Dashboard
  ## logic to display either forms or columns with appropriate tiles.
    
    if strong_params[:action] == "new" || strong_params[:action] == "edit"
      ## display form and pass appropriate components directly from controllers.
      form(@subject)
    
    else
      ## display columns and pass through necessary locals to specify the colunn tiles.
      column_display
    end
  end 

  def column_display
    content_tag("main", class:"p-3 inline-flex") do
      @column_headings.each do |heading|
       concat column_content(heading: heading)  
      end
    end
  end

  def column_content(heading:)
    content_tag("div", class: "flex-shrink-0 ml-3 w-80 mt-2 p-3 bg-gray-100 rounded") do
      content_tag("ul", class: "mt-2") do
       concat content_tag(:div, "#{heading.titleize}", class: "text-sm font-medium text-gray-900") 
       concat tiles(tiling_elements: @tiling_elements, sorting_condition: heading)
       concat new_package(heading) if strong_params[:controller] == "companies"
      end
    end
  end

  
  private

  def strong_params
    params.permit(:controller, :action, :id, :company_id, :user_id, :role, :account_id, :package_id)
  end
  
end
