class CreatePreferredPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :preferred_positions do |t|
      t.string :name

      t.timestamps
    end
  end
end
