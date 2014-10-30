class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :answers_count
      t.integer :poll_id

      t.timestamps
    end
  end
end
