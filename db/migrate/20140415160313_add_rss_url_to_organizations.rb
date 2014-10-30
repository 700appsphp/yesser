class AddRssUrlToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :rss_url, :string
  end
end
