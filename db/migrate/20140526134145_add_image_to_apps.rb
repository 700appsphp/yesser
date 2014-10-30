class AddImageToApps < ActiveRecord::Migration
  def change
    add_column :apps, :image, :string
  end
end
