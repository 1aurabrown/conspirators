class IndexCard < HasVcards::Vcard
  self.table_name = :has_vcards_vcards
  

  def name
    "#{self.given_name} #{self.family_name ? " " : ''}#{self.family_name}"
  end
  has_many :contacts, class_name: 'HasVcards::PhoneNumber'  do

    def build_defaults
      ['Phone', 'Mobile', 'Email'].each do |phone_number_type|
        next if select { |contact| contact.phone_number_type == phone_number_type }.present?
        build(phone_number_type: phone_number_type)
      end
    end
  end

  rails_admin do
    navigation_label 'Address book'

    label "Index Card" 
    label_plural "Index Cards"    
    navigation_icon "icon-fax"
    field :given_name
    field :family_name
    field :address
  end
end