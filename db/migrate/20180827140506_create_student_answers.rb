class CreateStudentAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :student_answers do |t|
      t.references :student, foreign_key: true
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
