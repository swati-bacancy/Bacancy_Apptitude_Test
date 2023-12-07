class AddCheckedByToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :checked_by, :string
  end
end
