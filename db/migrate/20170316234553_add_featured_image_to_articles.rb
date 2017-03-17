class AddFeaturedImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured_image_id, :integer
    add_index :articles, :featured_image_id
  end
end
