class AddIsTechnicalToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :is_technical, :boolean, default: false
  end
end
