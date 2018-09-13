class AddTechnicalMarksToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :technical_marks, :decimal
  end
end
