class User < ApplicationRecord
  has_many :positions
  has_many :companies, through: :positions
  has_many :associates, through: :companies, source: :users
  has_many :accounts, through: :companies
  has_many :account_comments, through: :accounts
  has_many :packages, through: :accounts
  
  has_many :package_comments, through: :packages
  
  accepts_nested_attributes_for :positions
 # accepts_nested_attributes_for resource, reject_if: proc { |attributes| attributes[:first_name].blank? }

 
 # Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :invitable, :database_authenticatable, :registerable,
 :recoverable, :rememberable, :validatable, :confirmable
 
 scope :specific_for, -> (name, rle) {where(role: rle).where.not(id: name).distinct}
 scope :specific_to, -> (name) {where.not(id: name).distinct}
 
 
 def associate_categories(var="all")
   if var == "all"
     self.associates.select(:role).distinct
     #self.associates.select(:role).distinct.each { |category| category[:role] }
   else
     self.associates.select(:role).distinct.where(:role => var)
   end
 end


 def specified_associates(user_role:, company:)
  self.associates.where(role: user_role).where.not(id: self).distinct.merge(Company.where(id: company))
 end
 
 
 enum role: [:manager, :contact, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :contact
  end

  def documents
    Document.where(:package_id => self.packages)  
  end

  def all_associated_users
    if self.admin?
      User.where.not(name: "#{self.name}")
    else
      self.associates.where.not(name: "#{self.name}")
    end
  end


  def current_user_companies
    current_user.companies  
  end

  def heading(var="all")
    if var == "all"
      "All Associates"
    else
      "Associated "+var.titleize.pluralize
    end
  end
 
  def associated_users(var="all", main_user)
    if main_user.admin?
      if var == "all"
        main_user.associates.where.not(name: "#{main_user.name}")      
      else
        main_user.associates.where(role: var).where.not(name: "#{main_user.name}")
      end
    else
      if var == "all"
        main_user.associates.where.not(name: "#{main_user.name}")      
      else
        main_user.associates.where(role: var).where.not(name: "#{main_user.name}")
      end
    end
  end

  def roles
    ["all", "manager", "contact", "admin"]  
  end

  def domain
    case self.role
      when "admin"
        return "company"
      when "manager"
        return "company"
      when "contact"
        return "account"
    end
  end
  
  def author
    case self.role
      when "admin"
        return "company"
      when "manager"
        return "account"
      when "contact"
        return "package"
    end
  end

  def domains
    case self.role
      when "admin"
       return Company.all
      when "manager"
       return self.companies
      when "contact"
       return self.accounts
    end
  end
end