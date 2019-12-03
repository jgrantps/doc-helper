module ApplicationHelper
  def upper_block(f)
    render partial: "dashboard/upper_block", locals: {:title => f}
  end
end
