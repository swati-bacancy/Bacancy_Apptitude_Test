class AddColumnsToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :location, :string
    add_column :students, :preferred_position, :string
  end
end
