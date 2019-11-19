class Account < ApplicationRecord
  belongs_to :company
  has_many :account_comments
  has_many :packages
  has_many :documents, through: :packages
  has_many :positions, through: :company
  has_many :users, through: :positions
  
  def name
    self.name
  end

  def users
    self.company.users
  end

  


end
