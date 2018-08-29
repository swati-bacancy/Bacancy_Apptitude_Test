class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :option
      t.text :option_value
      t.boolean :is_answer
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
