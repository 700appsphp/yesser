class CreateRsses < ActiveRecord::Migration
  def change
    create_table :rsses do |t|
      t.integer :organization_id
      t.string :url

      t.timestamps
    end
  end
end
