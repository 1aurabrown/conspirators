class ChangePageTexts < ActiveRecord::Migration
  def change
    add_column :page_texts, :page, :integer
    remove_column :page_texts, :title
  end
end
