class PackageComment < ApplicationRecord
  belongs_to :package
  belongs_to :user

  def account
    self.package.account
  end

  def company
    account.company
  end

end
