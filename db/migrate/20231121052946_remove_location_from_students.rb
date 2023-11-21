class RemoveLocationFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :location, :string
  end
end
