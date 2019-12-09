module ApplicationHelper
  def upper_block
    render partial: "dashboard_elements/upper_block"
  end

   def data_sidebar_menu(f)
    render partial: "dashboard_elements/data_sidebar", locals: {:title => f, :test => @test}
  end

  def canvas(column_headings:)

    # logic to display either forms or columns with appropriate tiles.
     render partial: "dashboard_elements/canvas_elements/column_display", locals: {:column_headings => column_headings}  #=> display columns and pass through necessary locals to specify the colunn tiles.
        
  end



  #logic to control contents inside of the columns tiles IF called by the CANVAS method.
  
end
