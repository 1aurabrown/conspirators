class AddCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.attachment :logo
      t.string :name, null: false
      t.string :url, null: false
    end
  end
end
