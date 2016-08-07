class AddressBookEntry < ActiveRecord::Base
  belongs_to :person, polymorphic: true
  delegate :first_name, to: :person
  delegate :last_name, to: :person
  delegate :middle_name, to: :person
  delegate :email, to: :person
  rails_admin do
    navigation_label 'Contacts'
  end

end
