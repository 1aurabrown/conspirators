class AddAllportContactToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :middle_name, :string
    add_column :talents, :email, :string
  end
end
