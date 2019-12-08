module DomainsHelper

  def domains_sidebar_menu 
    content_tag(:div, id: "sidebar") do
      domains_title + domains_collection(current_user.domains) + new_domain
    end
  end

  # Determines Title of the Sidebar menu (Company/Accounts/etc...)
  def domains_title
    content_tag(:h2, class: "mt-8 text-xs font-semibold text-gray-600 uppercase tracking-wide") do 
      current_user.domain.pluralize 
    end 
  end
  
  def domains_collection(domains)
    content_tag(:div, class: "mt-2 -mx-3") do
      domains.all.each do |domain|
        concat domains_link(domain)
      end
    end
  end

  def domains_link(domain)
    link_to user_company_path(current_user.id, domain.id), :class=> "flex justify-between item-center px-3 py-1 text-sm font-medium text-gray-700 rounded-lg hover:bg-gray-200" do 
      domain.name      
    end
  end

  def new_domain
    content_tag(:button, class: "mt-3 py-2 px-3 flex items-center text-sm font-medium text-gray-600 border border-gray-300 rounded hover:bg-gray-200") do 
      cross + add_domain_link  
    end
  end

  def cross
    content_tag(:svg, class: "h-5 w-5 text-gray-500", height: "568.89", viewBox: "0 0 426.67 426.67", width: "568.89") do
      cross_paths
    end
  end

  def cross_paths 
    tag1 = tag("path", d: "M410.67 229.33H16a16 16 0 010-32h394.67a16 16 0 010 32zm0 0", fill: "#8C8C8C")
    tag2 = tag("path", d: "M213.33 426.67a16 16 0 01-16-16V16a16 16 0 0132 0v394.67a16 16 0 01-16 16zm0 0", fill: "#8C8C8C")
    tag1 + tag2
  end

  def add_domain_link
    route = "new_#{current_user.author.downcase}_path"
    content_tag(:span, class: "ml-2") do
      concat link_to "New #{current_user.author.titleize}", send(route)
    end
  end
end