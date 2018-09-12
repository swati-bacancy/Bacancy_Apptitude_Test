class ChangeCorrectAnswerToBeIntegerInResults < ActiveRecord::Migration[5.1]
  def self.up
    change_column :results, :correct_answer, 'integer USING CAST(correct_answer AS integer)'

  end

  def self.down
    change_column :results, :correct_answer, :string
  end
end
