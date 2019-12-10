module FormHelper
  

  def formm(object)
    content_tag("main", class: "py-5 w-full item-center inline-flex") do 
      content_tag("div", class: "w-full h-auto item-center") do 
        form(object)
      end  
    end
  end




  def form(object)
    form_for(object, html: {class: 'h-full w-3/4 bg-gray-100 border-t border-r border-b rounded-r-lg border-gray-500 p-4'}) do |instance|
      concat primary_subject(instance)
       concat tag.br   
      concat parent_select(instance)
       concat tag.br      
      concat nested_new_parent(instance)
       concat tag.br      
      concat new_child(instance)
      concat submit_form(instance)
    end
  end


#=> Main subject the form eg: Account, Package, etc...
  def primary_subject(instance)
    content_tag("div", class: "flex item-center") do
      primary_subject_details(instance)
    end
  end

  def primary_subject_details(instance)
   concat instance.label :name, "Account Name:", class:'text-xl item-center text-gray-900 mr-4 leading-tight' 
   concat instance.text_field :name, class:'border border-gray-250 rounded'
  end




#=> filters nested companies to choose from based on user role.
  def parent_select(account)
    case current_user.role
      
    when "admin"
     concat account.label :company_id, "Associated Company" 
            account.collection_select :company_id, Company.all, :id, :name, prompt: true
      
    when "manager"
     concat account.label :company_id, "Associated Company" 
            account.collection_select :company_id, current_user.companies, :id, :name, prompt: true
      
    when "contact"
    end
  end

  #=> adds "new parent" as a nested component to the new primary subject form if user is "admin", ignores the field if otherwise
  def nested_new_parent(account)
    if current_user.role == "admin"
      concat tag.p "Create a New Company"
      account.fields_for :company do |parent_fields|
        concat nested_parent_fields(parent_fields)    
      end
    end
  end
  
  def nested_parent_fields(parent_fields)
    content_tag("div", class: "nested_fields") do
      concat parent_fields.label :name
      concat parent_fields.text_field :name, class:'border border-gray-250 rounded'
    end
  end
  
  #=> adds "new child" as a nested component to the new primary_subject form
  def new_child(instance)
    concat tag.p "Add new Packages" 
    instance.fields_for :packages do |child_fields|
      new_child_fields_wrapper(child_fields) 
    end
  end

  def new_child_fields_wrapper(child_fields)
    content_tag("div", class:"flex items-center py-2 justify-right") do
     concat child_fields_components1(child_fields)
     concat child_fields_components2(child_fields)      
    end
  end

  def child_fields_components1(child_fields)
    content_tag("div", class: "mx-4") do 
     concat child_fields.label :name 
     concat child_fields.text_field :name, class:'border border-gray-250 rounded'  
    end
  end
  
  def child_fields_components2(child_fields)
    content_tag("div", class: "mx-4") do 
     concat child_fields.label :status 
     concat child_fields.select :status, Package.status  
    end
  end  
  #=> Submit Button
  def submit_form(instance)
    instance.submit "Create Account", class: "bg-gray-100 flex items-center mt-4 py-1 px-3 border border-gray-500 rounded cursor-pointer hover:bg-gray-200"
  end
end
####=> adds "new child" as a nested component to the new primarysubject form
