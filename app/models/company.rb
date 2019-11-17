class Company < ApplicationRecord
  has_many :accounts
  has_many :positions
  has_many :users, through: :positions
end
