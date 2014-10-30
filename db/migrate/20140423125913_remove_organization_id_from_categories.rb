class RemoveOrganizationIdFromCategories < ActiveRecord::Migration
  def change
  	remove_column :categories, :organization_id
  end
end
