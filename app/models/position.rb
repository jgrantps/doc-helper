class Position < ApplicationRecord
  belongs_to :user 
  belongs_to :company
  accepts_nested_attributes_for :company, reject_if: proc {|attributes| attributes['name'].blank?}


  def form_child_title
    "Add New Positions"  
  end
end
