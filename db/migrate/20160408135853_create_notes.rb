class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :contactable, polymorphic: true, index: true
      t.text :content
      t.timestamps
    end
  end

end
