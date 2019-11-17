class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
