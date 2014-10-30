class AddOrganizationIdToComplains < ActiveRecord::Migration
  def change
    add_column :complains, :organization_id, :integer
  end
end
