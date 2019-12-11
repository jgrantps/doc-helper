module PackagesHelper
    #=> Set New Form Button Appearance in Canvas

    def show_button(heading)
        if strong_params[:controller] == "companies"
            package_button(heading)
        end
    end


    # => New Package Button

 def new_package(heading)
    concat new_package_svg +
    new_package_button_text(heading)
 end

 def new_package_svg
   content_tag("svg", class: "h-3 w-3", height: "568.89", viewBox: "0 0 426.67 426.67", width: "568.89")  do
     concat new_package_button_paths
   end
 end

 def new_package_button_paths
    content_tag("path", d: "M410.67 229.33H16a16 16 0 010-32h394.67a16 16 0 010 32zm0 0", fill: "white") +
    content_tag("path", d: "M213.33 426.67a16 16 0 01-16-16V16a16 16 0 0132 0v394.67a16 16 0 01-16 16zm0 0", fill: "white")
 end

 def new_package_button_text(heading)
   c = Company.find(strong_params[:id])

   content_tag("span", class: "") do
     link_to "NEW PACKAGE", new_account_package_path(Account.new_package_reference(companny: c, name: heading).first.id) 
   end  
 end



 #=> build styling for new subject button
 def package_button(heading)
    content_tag("button", class: "px-4 py-2 my-4 flex items-center text-sm font-medium text-white bg-gray-800 rounded-lg hover:bg-gray-700") do
        content_tag("svg", class: "h-3 w-3", height:"568.89", viewBox:"0 0 426.67 426.67", width:"568.89") do
            button_svg
        end
        new_package(heading)
    end
 end

 def button_svg
    content_tag("path", d: "M410.67 229.33H16a16 16 0 010-32h394.67a16 16 0 010 32zm0 0", fill:"white" ) +
    content_tag("path", d: "M213.33 426.67a16 16 0 01-16-16V16a16 16 0 0132 0v394.67a16 16 0 01-16 16zm0 0", fill: "white")
 end
end