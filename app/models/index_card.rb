class IndexCard < HasVcards::Vcard
  self.table_name = :has_vcards_vcards
  has_many :contacts, class_name: 'HasVcard::TelephoneNumber', inverse_of: :IndexCard do
    def build_defaults
      ['Phone', 'Mobile', 'Email'].each do |phone_number_type|
        next if select { |contact| contact.phone_number_type == phone_number_type }.present?
        build(phone_number_type: phone_number_type)
      end
    end
  end
end