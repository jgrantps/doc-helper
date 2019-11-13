class Document < ApplicationRecord
  belongs_to :package
  belongs_to :account, through: :package
  belongs_to :company, through: :account
  has_many :users_companies, through: :company
  has_many :users, through: :users_companies
end
