class RemoveLines < ActiveRecord::Migration
  def change
    drop_table :lines_articles
    drop_table :lines_authorables
    drop_table :lines_authors
    drop_table :lines_pictures
    drop_table :lines_users
    drop_table :friendly_id_slugs
  end
end
