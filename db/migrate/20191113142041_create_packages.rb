class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :account_id
      t.integer :status
      t.datetime :due_date

      t.timestamps
    end
  end
end
