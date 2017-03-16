class MakeArticleAttachment < ActiveRecord::Migration
  def change
    remove_column :articles, :video_url, :string
    remove_column :articles, :media_type, :integer
  end
end
