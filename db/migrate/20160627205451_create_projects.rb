class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :place
      t.integer :category_id
      t.integer :amount

      t.timestamps null: false
    end

    add_index :projects, :category_id
  end
end
