class RemoveLocationFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :location, :string
    remove_column :students, :url, :string
    remove_column :students, :mobile_number, :string
  end
end
