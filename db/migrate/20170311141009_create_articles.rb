class CreateArticles < ActiveRecord::Migration
  def change
    create_table :article_images, do |t|
      t.attachment :image
      t.boolean  :featured
      t.references  :article, index: true, foreign_key: true
    end

    create_table    :article_videos, do |t|
      t.string      :video_url
      t.attachment  :image
      t.references  :article, index: true, foreign_key: true
    end

    create_table :articles, do |t|
      t.string   :title
      t.text     :content
      t.string   :slug
      t.boolean  :featured, default: false
      t.datetime :published_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :subtitle
      t.integer  :media_type
    end
  end
end
