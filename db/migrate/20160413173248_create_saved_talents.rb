class CreateSavedTalents < ActiveRecord::Migration
  def change
    create_table :saved_talents do |t|
      t.references :talent, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
