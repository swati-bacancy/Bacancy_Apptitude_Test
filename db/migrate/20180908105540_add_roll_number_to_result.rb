class AddRollNumberToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :roll_number, :string
  end
end
