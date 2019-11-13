class CreateUsersCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :users_companies do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
