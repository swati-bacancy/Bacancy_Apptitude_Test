class AddTechAndNotTechToPreferredPosition < ActiveRecord::Migration[5.1]
  def change
    add_column :preferred_positions, :tech, :boolean, default: true
    add_column :preferred_positions, :non_tech, :boolean, default: true
  end
end
