class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude
      t.text :address
      t.string :logo
      t.string :website
      t.integer :organization_id
      t.integer :category_id

      t.timestamps
    end
  end
end
