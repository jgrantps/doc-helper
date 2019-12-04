module ApplicationHelper
  def upper_block(f)
    render partial: "dashboard_elements/upper_block", locals: {:title => f}
  end

  def user_sidebar_menu(f)
    render partial: "dashboard_elements/user_sidebar", locals: {:title => f}
  end

  def data_sidebar_menu(f)
    render partial: "dashboard_elements/data_sidebar", locals: {:title => f, :test => @test}
  end

  def canvas(f)
    
    # logic to display either forms or columns with appropriate tiles.
     render partial: "dashboard_elements/column_display", locals: {:column_tiles => package_status}  #=> display columns and pass through necessary locals to specify the colunn tiles.
        
  end

  def tiles(f)
    #logic to control contents inside of the columns tiles IF called by the CANVAS method.
    render partial: "dashboard_elements/sub_elements/column_tiles"
  end
end
