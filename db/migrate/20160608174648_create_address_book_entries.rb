class CreateAddressBookEntries < ActiveRecord::Migration
  def change
    create_table :address_book_entries do |t|
      t.references :person, polymorphic: true, index: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
