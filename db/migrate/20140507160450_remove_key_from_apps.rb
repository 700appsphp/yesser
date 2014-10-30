class RemoveKeyFromApps < ActiveRecord::Migration
  def change
    remove_column :apps, :key
  end
end
