class Package < ApplicationRecord
  has_many :documents
  has_many :package_comments
  belongs_to :account 
  
  alias_attribute  :parent_id, :account_id

  validates :name, :presence => true
  
  accepts_nested_attributes_for :account, reject_if: proc {|attributes| attributes['name'].blank?}
    
  enum status: [:backlog, :in_progress, :ready_for_review, :complete]
  
  scope :specific, -> (name) {where(id: name.packages)}
  
  def author(user)
    user
  end

  def package_comments_attributes=(attributes)
    
    attributes.values.each do |values|
      if !values[:comment].blank?       
        self.package_comments << PackageComment.find_or_create_by(values)
        # raise "inside".inspect
      end     
    end
  end

  def company 
   self.account.company 
  end
  
  def title 
    titles = company.positions.map {|position| position.title }
    titles.uniq
  end

  def users 
    company.users 
  end

  def self.status    
    self.statuses.keys 
  end

  
  ## form helpers to be called in forms
  def form_select_parent(instance:, current_user:, subject:)
    instance.collection_select :account_id, current_user.accounts.where(:company_id => 2), :id, :name, prompt: (subject.errors[:name].first || "Select A New #{ subject.form_parent_variables[:title].singularize}:")
  end
  
  def form_select_parent_label(instance:)
    instance.label self.account_id, "Associated Accounts", class: 'mr-2'
  end

  def form_parent_variables
    {:title => "Associated Account", 
     :var_id => :account_id, 
     :var_to_s =>"accounts",
     :var_all => Account.all}
  end

  def form_subject
    self
  end

  def form_child
    :package_comments
  end

  def form_child_title
    "Add A New Package Comment"  
  end

  def form_child_reference
    :comment
  end
end
