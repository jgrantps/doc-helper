class CreateAccountComments < ActiveRecord::Migration[6.0]
  def change
    create_table :account_comments do |t|
      t.string :comment
      t.integer :account_id
      t.integer :user_id
      t.timestamps
    end
  end
end
