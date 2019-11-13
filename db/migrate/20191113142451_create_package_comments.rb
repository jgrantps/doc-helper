class CreatePackageComments < ActiveRecord::Migration[6.0]
  def change
    create_table :package_comments do |t|
      t.string :comment
      t.integer :package_id
      t.integer :account_id
      t.integer :company_id
      t.integer :users_company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
