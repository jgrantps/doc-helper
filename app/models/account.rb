class Account < ApplicationRecord
  belongs_to :company
  has_many :account_comments
  has_many :packages
  has_many :positions, through: :company
  has_many :users, through: :positions
  accepts_nested_attributes_for :company, reject_if: proc {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :packages


  scope :specific, -> (name) {where(id: name.accounts)}
  
  def users
    self.company.users
  end

  def package_attributes=(attributes)
    attributes.values.each do |v|
      self.packages << Package.find_or_create_by(v)
    end
  end


end
