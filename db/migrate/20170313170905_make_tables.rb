class MakeTables < ActiveRecord::Migration
  def change
   create_table :article_attachments do |t|
      t.belongs_to :article, foreign_key: true, index: true
      t.attachment :featured_image
      t.string :url
      t.string :type
      t.timestamps
    end

    create_table :article_images do |t|
      t.belongs_to :article_attachment, foreign_key: true, index: true
      t.attachment :image
      t.timestamps
    end
  end
end
