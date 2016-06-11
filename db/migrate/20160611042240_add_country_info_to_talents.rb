class AddCountryInfoToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :country_info, :text
  end
end
