class AddPopularityToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :popularity, :integer
  end
end
