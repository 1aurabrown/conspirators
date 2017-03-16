class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :articles, :type, :media_type
  end
end
