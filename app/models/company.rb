class Company < ApplicationRecord
  has_many :accounts
  has_many :packages, through: :accounts
  has_many :documents, through: :packages
  has_many :positions
  has_many :users, through: :positions

  

  def titles
    titles = self.positions.map {|position| position.title }
    titles.uniq
  end

  def involved_users
    self.users  
  end
end
