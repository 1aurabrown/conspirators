class Organization < ActiveRecord::Base
  belongs_to :main_contact, class_name: 'Agent'
  has_many :agents, inverse_of: :organization
  rails_admin do
    navigation_label 'Contacts'
  end
end
