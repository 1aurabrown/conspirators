class RemoveGenderFromTalents < ActiveRecord::Migration
  def change
    remove_column :talents, :gender, :integer
  end
end
