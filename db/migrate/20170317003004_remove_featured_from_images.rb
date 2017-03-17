class RemoveFeaturedFromImages < ActiveRecord::Migration
  def change
    remove_column :article_images, :featured, :boolean
  end
end
