# This migration comes from allport (originally 20160310012110)
class AddContactableToContact < ActiveRecord::Migration
  def change
    add_reference :allport_contacts, :contactable, index: true, polymorphic: true
  end
end
