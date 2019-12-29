class Package < ApplicationRecord
  has_many :documents
  has_many :package_comments
  belongs_to :account 
  
  alias_attribute  :parent_id, :account_id

  accepts_nested_attributes_for :account, reject_if: proc {|attributes| attributes['name'].blank?}
    
  enum status: [:backlog, :in_progress, :ready_for_review, :complete]
  # validates :name, presence: true
  
  def author(user)
    user
  end


  def package_comments_attributes=(attributes)
    attributes.values.each do |values|
      # raise params.inspect
      if !values[:comment].blank?
        comment = PackageComment.new(values)        
        self.package_comments << comment
      end
    end
  end

  scope :specific, -> (name) {where(id: name.packages)}

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
  def form_select_parent(instance:, current_user:)
    instance.collection_select :account_id, current_user.accounts.where(:company_id => 2), :id, :name, prompt: true
  end
  
  def form_select_parent_label(instance:)
    instance.label self.account_id, "Associated Accounts"
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
