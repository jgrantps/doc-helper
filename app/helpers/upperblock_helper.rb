module UpperblockHelper
  def ribbon_title
    content_tag("h2", class: "text-2xl font-semibold text-gray-900 leading-tight") do
      @title.titleize.pluralize
    end
  end

  def new_package
    
     new_package_svg +
     new_package_button_text
    
  end

  def new_package_svg
    content_tag("svg", class: "h-3 w-3", height: "568.89", viewBox: "0 0 426.67 426.67", width: "568.89")  do
      new_package_button_paths
    end
  end

  def new_package_button_paths
    content_tag("path", d: "M410.67 229.33H16a16 16 0 010-32h394.67a16 16 0 010 32zm0 0", fill: "white") +
    content_tag("path", d: "M213.33 426.67a16 16 0 01-16-16V16a16 16 0 0132 0v394.67a16 16 0 01-16 16zm0 0", fill: "white")
  end

  def new_package_button_text
    content_tag("span", class: "") do
      link_to "NEW PACKAGE", new_package_path
    end  
  end
end