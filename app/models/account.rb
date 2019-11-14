class Account < ApplicationRecord
  belongs_to :company
  has_many :account_comments
  has_many :packages
  has_many :documents, through: :packages
  has_many :user_companies, through: :company
  has_many :users, through: :user_companies
  
end
