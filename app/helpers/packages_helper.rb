module PackagesHelper

 def new_package(heading)
    content_tag("button", class: "px-4 py-2 my-4 flex items-center text-sm font-medium text-white bg-gray-800 rounded-lg hover:bg-gray-700") do
      concat new_package_svg 
      concat new_package_button_text(heading)
  end
 end

 def new_package_svg
   content_tag("svg", class: "h-3 w-3 mr-2", height: "568.89", viewBox: "0 0 426.67 426.67", width: "568.89")  do
     concat( tag("path", d: "M410.67 229.33H16a16 16 0 010-32h394.67a16 16 0 010 32zm0 0", fill: "white")) 
     concat( tag("path", d: "M213.33 426.67a16 16 0 01-16-16V16a16 16 0 0132 0v394.67a16 16 0 01-16 16zm0 0", fill: "white"))
   end
 end

 ## allows for duplicate account titles to be held by different companies, 
 ## and ensures appropriate account path is selected.
 def new_package_button_text(heading)
   c = Company.find(strong_params[:id])
   content_tag("span", class: "") do
     link_to "NEW PACKAGE", new_account_package_path(Account.new_package_reference(companny: c, name: heading).first.id) 
   end  
  end

end