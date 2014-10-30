class CorrectVisionAttributeNameInOrganizations < ActiveRecord::Migration
  def change
    rename_column :organizations, :vission, :vision
  end
end
