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


  def contacts_count
    self.count{|u| u.role=="contact"}
  end

end
