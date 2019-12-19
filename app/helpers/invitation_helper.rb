module InvitationHelper
  ###################
  #=>  Invitation form to add new users
  def invitation_form(subject)
    form_for(resource, as: resource_name, url: invitation_path(resource_name), html: { method: :post, class: "form-builder"}) do |instance|
      render "devise/shared/error_messages", resource: resource
       invitation_email_form(parent_builder: instance) 
      
      concat  instance.label :role, class: "text-xl item-center text-gray-900 mr-4 leading-tight"
      concat  instance.select :role, User.roles.keys.to_a, class: "input" 
      concat child_fields(instance: instance)
      concat  instance.submit t("devise.invitations.new.submit_button")
     
    end    
  end
  
  def invitation_email_form(parent_builder:)
    resource.class.invite_key_fields.each do |field|
       concat email_fields(parent_builder: parent_builder, field: field)      
      
    end
  end
  
  def email_fields(parent_builder:, field:)
    content_tag "div", class: field do
      concat parent_builder.label field, class: "findme"
      concat parent_builder.text_field field, class: "input"
    end
  end

  def child_fields(instance:)
    instance.fields_for :position do |p|
      p.fields_for :companies do |c|
        # raise params.inpsect
      concat  c.label label @subject.form_parent_variables[:var_id], @subject.form_parent_variables[:title]
      concat  c.collection_select @subject.form_parent_variables[:var_id], @subject.form_parent_variables[:var_all], :id, :name, prompt: true
      end
    end
  end
end