class RemoveThingsFromAddressBookEntry < ActiveRecord::Migration
  def change
    remove_column :address_book_entries, :first_name, :string
    remove_column :address_book_entries, :last_name, :string
    remove_column :address_book_entries, :middle_name, :string
    remove_column :address_book_entries, :email, :string
  end
end
