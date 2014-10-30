class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :url
      t.string :key
      t.string :type
      t.timestamps
    end
  end
end
