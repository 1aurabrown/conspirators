class CreatePageTexts < ActiveRecord::Migration
  def change
    create_table :page_texts do |t|
      t.string :title
      t.text :text
      t.timestamps null: false
    end
  end
end
