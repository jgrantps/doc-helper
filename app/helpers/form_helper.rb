module FormHelper
  #=> styling wrappers
  def form(subject)    
    content_tag("main", class: "py-5 w-full item-center inline-flex") do 
      content_tag("div", class: "w-full h-auto item-center") do 
        # if strong_params[:controller] == "associates"
        #   render partial: "dashboard_elements/invitation_template", locals: {:resource => subject}  
        # #  invitation_form(subject)
        # else
          form_structure(subject)
        # end  
      end  
    end
  end
   
  
  #=> main method for composing the form's structure.  
  #=> Builds out the main subject, nested parents and children, and the submit button.
  #=> Routes the form submission to path based on the supplying controller.
    def form_structure(subject)
    form_for(subject, url: @route_path, html: {class: 'h-full w-3/4 bg-gray-100 border-t border-r border-b rounded-r-lg border-gray-500 p-4'}) do |instance|
      case strong_params[:controller]
              
      ## New Associate form
      when "associates"
        render partial: "dashboard_elements/invitation_template", locals: {:resource => subject}  
      
      ## New Company form  
      when "companies"
        concat primary_subject(instance)
        concat subject.form_select_parent_label(instance: instance)   
        concat subject.form_select_parent(instance: instance, current_user: current_user)   
        concat tag.br      
        concat new_child(instance)
        concat submit_form(instance)
          
      ## New Account form
      when "accounts"
        concat primary_subject(instance)
        concat subject.form_select_parent_label(instance: instance)   
        concat subject.form_select_parent(instance: instance, current_user: current_user)   
        concat tag.br      
        concat nested_new_parent(instance)
        concat tag.br      
        nested_parent_tag(instance)
        concat new_child(instance)
        concat submit_form(instance)
            
      ## New Package form
      when "packages"
        concat primary_subject(instance)
        concat primary_subject_collection_selection(instance)
        concat tag.br      
        concat new_child(instance)
        concat submit_form(instance)
        
      ## New Package Comment form
      when "package_comments"
        concat primary_subject(instance)
        concat submit_form(instance)
        
      end
    end      
  end
  
  
  
  
  
  ###################
  #=> adds "Main subject" to the form eg: Account, Package, etc...
  def primary_subject(instance)
    content_tag("div", class: "flex item-center") do
      if strong_params[:controller] == "package_comments"
        primary_subject_details_comments(instance)
      else
        primary_subject_details(instance)
      end
    end
  end  
  
  #=> distinguishes comment field for adding comments  
  def primary_subject_details_comments(instance)
    concat instance.label :name, "#{@subject.class} comment:", class:'text-xl item-center text-gray-900 mr-4 leading-tight' 
    concat instance.text_field :comment, class:'border border-gray-250 rounded'
  end
  
  def primary_subject_details(instance)
    concat instance.label :name, "#{@subject.class} Name:", class:'text-xl item-center text-gray-900 mr-4 leading-tight' 
    concat instance.text_field :name, class:'border border-gray-250 rounded'
  end
  
  #=> Main subject Supplemental form elements(attribute collection select)
  def primary_subject_collection_selection(instance)
    content_tag("div", class: "mx-4") do 
      concat instance.label @subject_collection_attribute 
      concat instance.select @subject_collection_attribute, @subject_class_attribute    
    end
  end
  
  #=> filters nested parent instances to choose from based on user role.
  def parent_select(instance)
    case current_user.role      
    when "admin"
      instance.label @subject.form_parent_variables[:var_id], @subject.form_parent_variables[:title] 
      instance.collection_select @subject.form_parent_variables[:var_id], @subject.form_parent_variables[:var_all], :id, :name, prompt: true
      
    when "manager"        
      concat @subject.form_parent(instance: instance, current_user: current_user)
    when "contact"
    end
  end
  
  
  
  
  ###################
  #=> adds "new parent" as a nested component to the new primary subject form if user is "admin", ignores the field if otherwise
  def nested_new_parent(instance)
    if current_user.role == "admin"
      concat tag.p "Create a New Company"
      instance.fields_for :company do |parent_fields|
        concat nested_parent_fields(parent_fields)    
      end
    end
  end
  
  #=> styles nested parent label and text fields.
  def nested_parent_fields(parent_fields)
    content_tag("div", class: "nested_fields") do
      concat parent_fields.label :name
      concat parent_fields.text_field :name, class:'border border-gray-250 rounded'
    end
  end
  
  
  
  
  ###################
  #=> adds "new child" as a nested component to the new primary_subject form
  def new_child(instance)
    concat tag.p "#{@subject.form_child_title}" 
    instance.fields_for @subject.form_child do |child_fields|
      new_child_fields_wrapper(child_fields) 
    end
  end
  
  def new_child_fields_wrapper(child_fields)
    content_tag("div", class:"flex items-center py-2 justify-right") do
      concat child_fields_components1(child_fields)
      if strong_params[:controller] == "accounts"
        concat child_fields_components2(child_fields)
      end
    end
  end
  
  #=> configures the different nested child fields (ie package, package_comment, etc...)
  def child_fields_components1(child_fields)
    content_tag("div", class: "mx-4") do 
      concat child_fields.label @subject.form_child_reference 
      concat child_fields.text_field @subject.form_child_reference, class:'border border-gray-250 rounded'
    end
  end
  
  def child_fields_components2(child_fields)
    content_tag("div", class: "mx-4") do
      concat child_fields.label @child_collection_attribute 
      concat child_fields.select @child_collection_attribute, @child_class_attribute  
    end
  end  
  
  def nested_parent_tag(instance)
    concat hidden_field_tag :account_id, strong_params[:account_id]  
  end
  
  
  
  
  
  ###################
  #=> Submit Button
  def submit_form(instance)
    instance.submit "Create #{@subject.class.name}", class: "bg-gray-100 flex items-center mt-4 py-1 px-3 border border-gray-500 rounded cursor-pointer hover:bg-gray-200"
  end    
end