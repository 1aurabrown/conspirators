class ChangeToEnum < ActiveRecord::Migration
  def change
    remove_column :articles, :type, :string
    add_column :articles, :type, :integer
  end
end
