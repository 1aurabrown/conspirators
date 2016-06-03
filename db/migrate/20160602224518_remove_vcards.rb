class RemoveVcards < ActiveRecord::Migration
  def change
    drop_table :allport_contact_cards
  end
end
