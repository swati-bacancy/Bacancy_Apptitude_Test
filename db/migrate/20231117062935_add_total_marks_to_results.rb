class AddTotalMarksToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :total_marks, :integer
  end
end
