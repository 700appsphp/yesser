class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :arabic_name
      t.string :english_name
    end
  end
end
