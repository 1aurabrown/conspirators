class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender

      t.timestamps null: false
    end
  end
end
