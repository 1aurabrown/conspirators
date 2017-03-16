class TryAgain < ActiveRecord::Migration
  def change
    drop_table :images
    drop_table :article_album_images
    drop_table :article_albums
    drop_table :video_url
    remove_column :articles, :media_id
    remove_column :articles, :media_type
    add_column :articles, :type, :string
  end
end
