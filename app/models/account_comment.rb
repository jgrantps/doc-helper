class AccountComment < ApplicationRecord
  belongs_to :account 
  belongs_to :user

  def company
    self.account.company
  end
  
end
