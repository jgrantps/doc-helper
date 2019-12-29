class PackageComment < ApplicationRecord
  belongs_to :package
  belongs_to :user
  alias_attribute  :parent_id, :package_id

  validates :comment, :presence => true
  
  def account
    self.package.account
  end

  def parent
    self.package
  end

  def company
    account.company
  end

end
