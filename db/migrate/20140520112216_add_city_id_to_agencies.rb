class AddCityIdToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :city_id, :integer
  end
end
