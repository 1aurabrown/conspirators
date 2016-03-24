class CreateSpokenLanguages < ActiveRecord::Migration
  def change
    create_table :spoken_languages do |t|
      t.string :language
      t.integer :level
      t.references :talent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
