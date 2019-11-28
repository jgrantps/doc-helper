class Document < ApplicationRecord
  belongs_to :package
  has_many :positions, through: :company
  has_many :users, through: :positions
end
