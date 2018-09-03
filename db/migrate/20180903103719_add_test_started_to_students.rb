class AddTestStartedToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :test_started, :boolean, default: false
  end
end
