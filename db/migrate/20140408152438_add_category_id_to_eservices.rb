class AddCategoryIdToEservices < ActiveRecord::Migration
  def change
    add_column :eservices, :category_id, :integer
  end
end
