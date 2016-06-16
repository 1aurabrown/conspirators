class AddVisibleOnMobileToTags < ActiveRecord::Migration
  def change
    add_column :tags, :visible_on_mobile, :boolean
  end
end
