class Company < ApplicationRecord
  has_many :accounts
  has_many :packages, through: :accounts
  has_many :documents, through: :packages
  has_many :positions
  has_many :users, through: :positions
  has_many :associates, through: :positions, source: :user


  scope :specific, -> (name) {where(id: name.companies)}

  def associated_users(var="all")
    if var == "all"
      self.associates.where.not(name: "#{self.name}")      
    else
      self.associates.where(role: var).where.not(name: "#{self.name}")
    end
  end

  def associate_categories(var="all")
    if var == "all"
      self.associates.select(:role).distinct
    else
      self.associates.select(:role).distinct.where(:role => var)
    end
  end

  def roles
    ["all", "manager", "contact", "admin"]  
  end

  def titles
    titles = self.positions.map {|position| position.title }
    titles.uniq
  end

  def involved_users
    self.users  
  end


end
