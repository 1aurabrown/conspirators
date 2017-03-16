class Media < ActiveRecord::Migration
  def change
    create_table :article_images do |t|
      t.attachment :image
      t.boolean :featured
      t.references :article, index:true, foreign_key: true
    end

    create_table :article_videos do |t|
      t.string :video_url
      t.attachment :image
      t.references :article, index:true, foreign_key: true
    end
  end
end
