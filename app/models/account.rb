class Account < ApplicationRecord
  belongs_to :company
  has_many :account_comments
  has_many :packages
  has_many :positions, through: :company
  has_many :users, through: :positions

  alias_attribute  :parent_id, :company_id

  # accepts_nested_attributes_for :company, reject_if: proc {|attributes| attributes['name'].blank?}
  
  scope :company, -> (name) {where(company_id: name)}
  scope :namme, -> (namme) {where(name: namme)}

  def packages_attributes=(attributes)
    attributes.values.each do |values|
      if !values[:name].blank?
        self.packages << Package.find_or_create_by(values)
      end
    end
  end

  def company_attributes=(attributes)
    if !attributes[:name].blank?
      if Company.find_by(:name => attributes[:name])
        # raise "find".inspect
        self.company = Company.find_by(:name => attributes[:name])
      else
        # raise "create".inspect
        self.company = Company.create(:name => attributes[:name])
        self.company.positions << Position.new(:title => "Creator", :user_id => attributes[:user_id], :company_id => self.company)
      end
    end 
  end

  def kompany
    Company.find(self[:company_id])
  end

  def users
    self.company.users
  end

  def form_subject
    self  
  end

  def form_child
    :packages
  end

  def form_child_title
    "Add New Packages"  
  end

  def form_child_reference
    :name
  end

  def form_select_parent(instance:, current_user:)
    instance.collection_select :company_id, current_user.companies, :id, :name, prompt: true
  end
  
  def form_select_parent_label(instance:)
    instance.label self.company_id, "Associated Companies"
  end
  
  def form_parent_variables
    {:title => "Associated Companies", 
     :var_id => :company_id, 
     :var_to_s =>"companies",
     :var_all => Company.all}
  end

  def self.new_package_reference(companny:, name:)
    company(companny).namme(name)
  end
end
