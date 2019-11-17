class Document < ApplicationRecord
  belongs_to :package
  belongs_to :account, through: :package
  belongs_to :company, through: :account
  has_many :positions, through: :company
  has_many :users, through: :positions
end
