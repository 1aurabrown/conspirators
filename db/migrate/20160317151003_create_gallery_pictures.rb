class CreateGalleryPictures < ActiveRecord::Migration
  def change
    create_table :gallery_pictures do |t|
      t.references :talent, index: true, foreign_key: true
      t.attachment :image

      t.timestamps null: false
    end
  end
end
