class Agent < ActiveRecord::Base
  belongs_to :organization, inverse_of: :agents
  has_one :address_book_entry, as: :person, inverse_of: :person
  after_save :create_address_book_entry

  def name
    "#{self.first_name} #{self.last_name ? " " : ''}#{self.last_name}"
  end
  def create_address_book_entry
    AddressBookEntry.find_or_create_by({person: self}).save!
  end

  rails_admin do
    navigation_label 'Contacts'
    list do
      field :name
      field :organization
    end
    edit do 
      configure :address_book_entry do
        hide
      end
    end
  end
end
