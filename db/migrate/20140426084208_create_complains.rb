class CreateComplains < ActiveRecord::Migration
  def change
    create_table :complains do |t|
      t.string :email
      t.string :agency_id

      t.timestamps
    end
  end
end
