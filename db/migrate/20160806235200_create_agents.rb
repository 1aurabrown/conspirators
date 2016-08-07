class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :middle_name
      t.string :email

      t.timestamps null: false
    end
  end
end
