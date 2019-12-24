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
     render partial: "dashboard_elements/canvas_elements/column_display", locals: {:column_headings => column_headings}  
    end
  end 
  
  private

  def strong_params
    params.permit(:controller, :action, :id, :company_id, :user_id, :role, :account_id, :package_id)
  end
  
end
