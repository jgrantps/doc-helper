class Company < ApplicationRecord
  has_many :accounts
  has_many :packages, through: :accounts
  has_many :documents, through: :packages
  has_many :positions
  has_many :users, through: :positions
  has_many :associates, through: :positions, source: :user


  def associated_users(var="all")
    if var == "all"
      self.associates.where.not(name: "#{self.name}")      
    else
      self.associates.where(role: var).where.not(name: "#{self.name}")
    end
  end

  def titles
    titles = self.positions.map {|position| position.title }
    titles.uniq
  end

  def involved_users
    self.users  
  end
  
  def involved_positions
    data = {}
    self.positions.each do |position|
      data.merge!("#{position.user.name}" => "#{position.title}")
    end
    data
  end


end
