class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
