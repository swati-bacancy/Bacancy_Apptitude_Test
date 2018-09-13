class AddColumnsToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :student, foreign_key: true
    add_column :answers, :answer, :text
  end
end
