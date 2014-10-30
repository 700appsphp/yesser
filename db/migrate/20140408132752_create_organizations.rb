class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude
      t.text :address
      t.text :mission
      t.text :vission
      t.text :message
      t.string :logo
      t.string :website

      t.timestamps
    end
  end
end
