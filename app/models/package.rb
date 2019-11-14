class Package < ApplicationRecord
  has_many :documents
  has_many :package_comments
  belongs_to :account 
  has_many :users_companies, through: :company
  has_many :users, through: :users_companies
end
