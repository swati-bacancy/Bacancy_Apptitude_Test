class AddTotalTimeToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :total_time, :string
  end
end
