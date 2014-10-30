class AddCityToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :city, :string
  end
end
