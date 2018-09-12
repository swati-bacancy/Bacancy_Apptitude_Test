class AddIsTechnicalToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :is_technical, :boolean, default: false
  end
end
