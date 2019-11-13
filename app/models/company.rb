class Company < ApplicationRecord
  has_many :accounts
  has_many :users_companies
  has_many :users, through: :users_companies
end
