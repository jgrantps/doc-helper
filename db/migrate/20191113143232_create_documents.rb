class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :package_id
      t.boolean :complete?
      t.datetime :due_date

      t.timestamps
    end
  end
end
