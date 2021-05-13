class AddUrlToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :url, :text
  end
end
