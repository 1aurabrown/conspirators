class AddPublishedToTalent < ActiveRecord::Migration
  def change
    add_column :talents, :published, :datetime
  end
end
