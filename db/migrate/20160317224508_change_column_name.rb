class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :roles_mask, :role
  end
end
