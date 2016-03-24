class AddSlugToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :slug, :string
    add_index :talents, :slug
  end
end
