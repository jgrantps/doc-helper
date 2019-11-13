class AddCompanyRefToUsersCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_companies, :company, null: false, foreign_key: true
  end
end
