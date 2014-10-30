class RenameComplainsToComplaints < ActiveRecord::Migration
  def change
    rename_table :complains, :complaints
  end
end
