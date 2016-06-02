class RemoveVcards < ActiveRecord::Migration
  def change
    drop_table :allport_contact_cards
    drop_table :has_vcards_addresses
    drop_table :has_vcards_phone_numbers
    drop_table :has_vcards_vcards
  end
end
