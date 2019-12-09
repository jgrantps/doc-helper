module ApplicationHelper
  def upper_block
    render partial: "dashboard_elements/upper_block"
  end

   def data_sidebar_menu(f)
    render partial: "dashboard_elements/data_sidebar", locals: {:title => f, :test => @test}
  end

  def canvas(column_headings:)
  # main component of the Dashboard
  # logic to display either forms or columns with appropriate tiles.
    
    if strong_params[:action] == "new" || strong_params[:action] == "edit"
     
      render partial: "dashboard_elements/canvas_elements/forms/new_account"
    else
     render partial: "dashboard_elements/canvas_elements/column_display", locals: {:column_headings => column_headings}  #=> display columns and pass through necessary locals to specify the colunn tiles.
    end
  end  
end
