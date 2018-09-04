class CreateJoinTableQuestionsTests < ActiveRecord::Migration[5.1]
  def self.up
    create_table :questions_tests, :id => false do |t|
      t.integer :question_id
      t.integer :test_id
    end
  end

  def self.down
    drop_table :questions_tests
  end
end
