class NonNullIds < ActiveRecord::Migration
  def change
    change_column :gallery_pictures, :talent_id, :integer, :null => false
    change_column :article_images, :article_id, :integer, :null => false
  end
end
