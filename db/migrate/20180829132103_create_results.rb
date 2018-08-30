class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :student, foreign_key: true
      t.integer :total_questions
      t.integer :attempted_questions
      t.string :correct_answer
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
