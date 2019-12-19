class Company < ApplicationRecord
  has_many :accounts
  has_many :packages, through: :accounts
  has_many :documents, through: :packages
  has_many :positions
  has_many :users, through: :positions
  has_many :associates, through: :positions, source: :user
  accepts_nested_attributes_for :accounts, reject_if: proc {|attributes| attributes[:name].blank?}

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
    titles = self.positions.map {|position| position.title }
    titles.uniq
  end

  def form_select_parent(instance:, current_user:)
    raise params
    instance.collection_select :associate.id, User.all, :id, :name, prompt: true
  end


  def form_select_parent_label(instance:)
    instance.label self, "Associated Users"
  end

  def form_child
    :accounts
  end

  def form_child_title
    "Add New Accounts"  
  end

  def form_child_reference
    :name
  end

  def involved_users
    self.users  
  end

end
