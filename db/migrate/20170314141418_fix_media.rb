class FixMedia < ActiveRecord::Migration
  def change
    drop_table :article_images
    drop_table :article_attachments

    create_table :images do |t|
      t.attachment :image
      t.timestamps
    end

    # join between image and album
    create_table :article_album_images do |t|
      t.references :image
      t.references :article_album
      t.boolean :featured
      t.timestamps
    end

    # article has EITHER an album
    create_table :article_albums do |t|
      t.timestamps
    end

    # OR a video
    create_table :video_url do |t|
      t.references :image
      t.string :url
      t.timestamps
    end
  end
end
