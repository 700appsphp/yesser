class RenameTypeToPlatformInApps < ActiveRecord::Migration
  def change
    rename_column :apps, :type, :platform
  end
end
