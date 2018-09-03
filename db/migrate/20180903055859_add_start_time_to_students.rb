class AddStartTimeToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :start_time, :datetime
  end
end
