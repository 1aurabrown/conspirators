class AddIndexToPageTexts < ActiveRecord::Migration
  def change
    add_column :page_texts, :type, :integer
    add_index :page_texts, :type
  end
end
