class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :organization_id

      t.timestamps
    end
  end
end
