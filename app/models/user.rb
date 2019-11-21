class User < ApplicationRecord
  has_many :positions
  has_many :companies, through: :positions
  has_many :accounts, through: :companies
  has_many :account_comments, through: :accounts
  has_many :packages, through: :accounts
  has_many :package_comments, through: :packages
  has_many :documents, through: :packages
  
  accepts_nested_attributes_for :positions
 # accepts_nested_attributes_for resource, reject_if: proc { |attributes| attributes[:first_name].blank? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  
  enum role: [:manager, :contact, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :contact
  end
  
  

  def associated_users(role)
    case role
      when "all"
        self.companies.map {|company| company.users}.flatten.uniq
      when "contact"
        self.companies.map {|company| company.users}.flatten.uniq.count{|u| u.role=="contact"}
      when "manager"
        self.companies.map {|company| company.users}.flatten.uniq.count{|u| u.role=="manager"}
    end
  end

  def associated_contacts
    self.companies.map {|company| company.users}.flatten.uniq.count{|u| u.role=="contact"}
  end

  def contacts_count
    if self.admin?
      User.where(role: "contact").count
    else
      users = []
      self.companies.each {|company|  users << company.users.where(role: "contact").pluck(:name)}
      users.uniq.flatten.count
    end
  end

  def managers_count
    if self.admin?
      User.where(role: "manager").count
    else
      users = []
      self.companies.each {|company|  users << company.users.where(role: "manager").pluck(:name)}
      users.uniq.flatten.count
    end
  end

  def admins_count
    if self.admin?
      User.where(role: "admin").count
    else
      users = []
      self.companies.each {|company|  users << company.users.where(role: "admin").pluck(:name)}
    
      users.uniq.flatten.count
    end
  end

  def all_count
    if self.admin?
      User.count
    else
      managers_count + contacts_count
    end
  end
end

# Or, in English: "return all categories that have articles, where those articles have a comment made by a guest, and where those articles also have a tag."
# Or, in English: "return all users that have positions, where those positions have a companies belonging to traci, and where those positions also have a role."

# {Category: User, articles: positions, comment: companies, guest: "traci", tag: role
# Category.joins(articles: [{ comments: :guest }, :tags])
# User.joins(positions: [{ companies: :self }, :role])