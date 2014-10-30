class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :organization_id
      t.string :ancestry
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
    add_index :categories, :ancestry
  end
end
