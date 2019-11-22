class Account < ApplicationRecord
  belongs_to :company
  has_many :account_comments
  has_many :packages
  has_many :documents, through: :packages
  has_many :positions, through: :company
  has_many :users, through: :positions
  accepts_nested_attributes_for :company
  
  def users
    self.company.users
  end




end
