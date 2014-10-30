class AddOrganizationIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :organization_id, :integer
  end
end
