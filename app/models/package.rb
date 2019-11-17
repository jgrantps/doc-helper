class Package < ApplicationRecord
  has_many :documents
  has_many :package_comments
  belongs_to :account 
  has_many :positions, through: :company
  has_many :users, through: :positions
end
