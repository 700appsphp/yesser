class CreateFaxes < ActiveRecord::Migration
  def change
    create_table :faxes do |t|
      t.string :number
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
