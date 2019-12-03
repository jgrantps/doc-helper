module ApplicationHelper
  def upper_block(f)
    render partial: "dashboard/upper_block", locals: {:title => f}
  end

  def user_sidebar_menu(f)
    render partial: "dashboard/user_sidebar", locals: {:title => f}
  end

  def data_sidebar_menu(f)
    render partial: "dashboard/data_sidebar", locals: {:title => f}
  end
end
