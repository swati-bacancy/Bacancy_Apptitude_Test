class CreateTermAndConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :term_and_conditions do |t|
      t.text :content

      t.timestamps
    end
    TermAndCondition.create({content: 'Test content'})
  end
end
