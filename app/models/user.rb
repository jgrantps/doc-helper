class User < ApplicationRecord
  has_many :positions
  has_many :companies, through: :positions
  has_many :associates, through: :companies, source: :users
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

  def all_associated_users
    if self.admin?
      User.where.not(name: "#{self.name}")
    else
      self.associates.where.not(name: "#{self.name}")
    end
  end
  
  def associated_users(var)
    self.associates.where(role: var).where.not(name: "#{self.name}")
  end

  def domain
    case self.role
      when "admin"
        return "Companies"
      when "manager"
        return "Companies"
      when "contact"
        return "Accounts"
    end
  end
  
  def author
    case self.role
      when "admin"
        return "company"
      when "manager"
        return "account"
      when "contact"
        return ""
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