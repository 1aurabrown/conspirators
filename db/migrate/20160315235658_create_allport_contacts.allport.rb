# This migration comes from allport (originally 20160310002533)
class CreateAllportContacts < ActiveRecord::Migration
  def change
    create_table :allport_contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email

      t.timestamps null: false
    end
  end
end
