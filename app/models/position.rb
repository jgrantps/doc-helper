class Position < ApplicationRecord
  belongs_to :user 
  belongs_to :company

  accepts_nested_attributes_for :user, reject_if: proc {|attributes| attributes['name'].blank?}

  def company_attributes=(company_params)
    if !company_params[:name].empty?
      c = Company.find_or_create_by(:name => company_params[:name])
      c.add_creator(creator: company_params[:creator])
      self.company = c
    end
  end

  def form_child_title
    "Add New Positions"  
  end
end
