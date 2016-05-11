class AddAcceptableToTags < ActiveRecord::Migration
  def change
    add_column :tags, :acceptable, :boolean
  end
end
