class RemoveArticleImages < ActiveRecord::Migration
  def change
    drop_table :article_images
  end
end
