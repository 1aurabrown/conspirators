class AddCountryCodeToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :country_code, :string
  end
end
