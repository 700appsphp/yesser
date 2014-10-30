class AddLogoToEservices < ActiveRecord::Migration
  def change
    add_column :eservices, :logo, :string
  end
end
