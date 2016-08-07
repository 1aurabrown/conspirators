class Agent < ActiveRecord::Base
  belongs_to :organization, inverse_of: :agents
  has_one :address_book_entry, as: :person
  accepts_nested_attributes_for :address_book_entry
  rails_admin do
    navigation_label 'Contacts'
  end
end
