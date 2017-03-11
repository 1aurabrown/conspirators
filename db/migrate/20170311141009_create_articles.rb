class CreateArticles < ActiveRecord::Migration
  def change
    create_table   :articles do |t|
      t.string     :title
      t.text       :content
      t.string     :slug
      t.boolean    :featured, default: false
      t.boolean    :published, default: false
      t.timestamp  :published_at
      t.string     :video_url
      t.integer    :media_type
      t.timestamps
    end

    create_table   :article_images do |t|
      t.belongs_to :article, foreign_key: true, index: true
      t.attachment :image
      t.boolean    :featured, default: false
      t.timestamps
    end
  end
end
