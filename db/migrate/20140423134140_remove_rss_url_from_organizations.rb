class RemoveRssUrlFromOrganizations < ActiveRecord::Migration
  def change
    remove_column :organizations, :rss_url
  end
end
