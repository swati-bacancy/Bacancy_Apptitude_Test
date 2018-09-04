class AddTestToStudentAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :student_answers, :test, foreign_key: true
  end
end
