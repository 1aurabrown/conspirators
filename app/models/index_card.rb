class IndexCard < HasVcards::Vcard
  self.table_name = :has_vcards_vcards
  

  def name
    "#{self.first_name} #{self.last_name ? " " : ''}#{self.last_name}"
  end
  has_many :contacts, class_name: 'HasVcards::PhoneNumber', inverse_of: :IndexCard do
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
  end
end