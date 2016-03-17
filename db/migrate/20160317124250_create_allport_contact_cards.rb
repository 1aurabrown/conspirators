class CreateAllportContactCards < ActiveRecord::Migration
  def change
    create_table :allport_contact_cards do |t|
      t.references :contactable, index: { name: :unique_contact_type_and_id }, polymorphic: true
      t.timestamps null: false
    end
  end
end
