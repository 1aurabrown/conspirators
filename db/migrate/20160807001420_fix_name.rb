class FixName < ActiveRecord::Migration
  def change
    rename_column :agents, :middle_name, :last_name

  end
end
