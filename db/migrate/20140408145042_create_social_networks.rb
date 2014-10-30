class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :url
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
