class AddPreferredPositionInStudents < ActiveRecord::Migration[5.1]
  def up
    remove_column :students, :preferred_position, :string
    add_reference :students, :preferred_position, foreign_key: true
  end

  def down
    add_column :students, :preferred_position, :string
    remove_reference :students, :preferred_position, foreign_key: true
  end
end
