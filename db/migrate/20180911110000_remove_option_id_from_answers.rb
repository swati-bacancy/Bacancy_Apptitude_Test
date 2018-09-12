class RemoveOptionIdFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_index :answers, :option_id
    remove_column :answers, :option_id, :integer
  end
end
