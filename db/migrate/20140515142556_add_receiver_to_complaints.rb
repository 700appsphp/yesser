class AddReceiverToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :receiver, :string
  end
end
