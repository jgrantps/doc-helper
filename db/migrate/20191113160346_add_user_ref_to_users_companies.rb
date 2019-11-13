class AddUserRefToUsersCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_companies, :user, null: false, foreign_key: true
  end
end
