class PackageComment < ApplicationRecord
  belongs_to :package
  belongs_to :account, through: :package
  belongs_to :company, through: :account 
  belongs_to :users_company, through: :company
  belongs_to :user, through: :users_company

end
