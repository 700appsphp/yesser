class CreateEservices < ActiveRecord::Migration
  def change
    create_table :eservices do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
