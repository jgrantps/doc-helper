class Account < ApplicationRecord
  belongs_to :company
  has_many :account_comments
  has_many :packages
  has_many :positions, through: :company
  has_many :users, through: :positions
  accepts_nested_attributes_for :company, reject_if: proc {|attributes| attributes['name'].blank?}
   accepts_nested_attributes_for :packages, reject_if: proc {|attributes| attributes['name'].blank?}
  scope :specific, -> (name) {where(id: name.accounts)}
  
  def packages_attributes=(attributes)
    attributes.values.each do |values|
      
      if !values[:name].blank?
        self.packages << Package.find_or_create_by(values)
      end
    end
  end


  def users
    self.company.users
  end

  def form_subject
    self  
  end

  def form_child
    self.packages
  end

  def form_parent(instance)
    instance.collection_select :company_id, current_user.companies, :id, :name, prompt: true
  end
  
  def form_parent_variables
    {:title => "Associated Companies", 
     :var_id => :company_id, 
     :var_to_s =>"companies",
     :var_all => Company.all}
  end



end
