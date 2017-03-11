class RemovePublishFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :published, :boolean
  end
end
