class AddPluralizeInHomePageToTags < ActiveRecord::Migration
  def change
    add_column :tags, :pluralize_in_home_page, :boolean
  end
end
