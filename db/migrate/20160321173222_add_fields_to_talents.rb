class AddFieldsToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :height, :integer
    add_column :talents, :age, :integer
  end
end
