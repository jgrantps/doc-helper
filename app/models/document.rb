class Document < ApplicationRecord
  belongs_to :package
  has_many :positions, through: :company
  has_many :users, through: :positions

  scope :specific, -> (name) {where(id: name.documents)}
end
