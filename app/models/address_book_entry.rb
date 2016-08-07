class AddressBookEntry < ActiveRecord::Base
  belongs_to :person, polymorphic: true

  delegate :first_name, to: :person
  delegate :last_name, to: :person
  delegate :email, to: :person
  delegate :organization, to: :person
  rails_admin do
    navigation_label 'Contacts'
    list do
      field :person_type do
        label 'Type'
      end
      field :first_name
      field :last_name
      field :email
      field :organization

    end
    edit do
      configure :person do
        hide
      end
      group :base_data do
        field :person_type do
          label 'Type'
          read_only true
          help ''
        end
        field :first_name do
          help 'will edit the agent or talent'
        end
        field :last_name do
          help 'will edit the agent or talent'
        end
        field :email do
          help 'will edit the agent or talent'
        end
        field :organization do
          read_only true
          help ''
        end
      end
      group :contact do
        field :phone_number
        field :city
        field :country
      end
    end
    show do
      field :person_type do
        label 'Type'
      end
      field :name
      field :email
      field :phone_number
      field :city
      field :country
      field :organization
    end
  end
end
