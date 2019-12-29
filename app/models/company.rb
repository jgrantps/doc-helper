class Company < ApplicationRecord
  has_many :accounts
  has_many :packages, through: :accounts
  has_many :documents, through: :packages
  has_many :positions
  has_many :users, through: :positions
  has_many :associates, through: :positions, source: :user
  accepts_nested_attributes_for :accounts, reject_if: proc {|attributes| attributes[:name].blank?}
  validates :name, :presence => true

  after_create :add_admins

  scope :specific, -> (name) {where(id: name.companies)}


  def positions_attributes=(attributes)
    attributes.values.each do |values|      
      if (!values[:title].blank? && !values[:user_attributes][:id].blank?)
        self.positions.build(:title => values[:title], :user_id => values[:user_attributes][:id])
      end
    end
  end

  def add_creator(creator:)
    c = self.positions.build(:title => "Creator", :user_id => creator.id)
    c.save
  end

  def add_admins 
    User.role_is("admin").each do |user|
      self.positions.create(:title => "system_administrator", :user_id => user.id)
    end
  end
  
  def user_attributes=(attributes)
    raise params.inspect
  end








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
