class Company < ApplicationRecord
  has_many :accounts
  has_many :packages, through: :accounts
  has_many :documents, through: :packages
  has_many :positions
  has_many :users, through: :positions
  has_many :associates, through: :positions, source: :user
  accepts_nested_attributes_for :accounts, reject_if: proc {|attributes| attributes[:name].blank?}
  accepts_nested_attributes_for :positions, reject_if: proc {|attributes| attributes[:title].blank?}
  
  scope :specific, -> (name) {where(id: name.companies)}

  def associated_users(var =  "all", excluded_name)
    if var == "all"
      self.associates.where.not(name: excluded_name)      
    else
      self.associates.where(role: var).where.not(name: excluded_name)
     
    end
  end

  def account_headings
    self.accounts.pluck(:name)
  end

  def associate_categories(var="all")
    if var == "all"
      self.associates.select(:role).distinct.where.not(name: "#{self.name}")
    else
      self.associates.select(:role).distinct.where(:role => var).where.not(name: "#{self.name}")
    end
  end

  def roles
    ["all", "manager", "contact", "admin"]  
  end

  def titles
    self.positions.pluck(:title).uniq    
  end

  def form_select_parent(instance:, current_user:)
    capture do
      User.roles.keys.each do |key|
         instance.label self, "Dropdown of #{key}s:" 
        instance.collection_select :user_ids, User.role_is(key), :id, :name, prompt: true
      end
    end
  end

  def iterated_keys(instance:)
  end



  def form_select_parent_label(instance:)
    # instance.label self, "Separate method!:"
  end

  def form_child_title
    "Add New Accounts"  
  end

  def form_child
    :accounts
  end

  def form_child_reference
    :name
  end

  def involved_users
    self.users  
  end

end
