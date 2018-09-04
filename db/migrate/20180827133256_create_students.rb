class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :course
      t.string :roll_number
      t.string :collage_name
      t.string :mobile_number
      t.timestamps
    end
  end
end
