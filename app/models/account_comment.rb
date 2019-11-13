class AccountComment < ApplicationRecord
  belongs_to :account 
  belongs_to :company, through: :account 
  belongs_to :users_company, through: :company 
  belongs_to :user, through: :users_company
  
end
