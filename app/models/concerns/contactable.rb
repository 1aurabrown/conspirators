
module Contactable
  extend ActiveSupport::Concern

  included do
    # Single/Main vcard
    has_one :index_card, as: 'reference',  autosave: true, validate: true
    accepts_nested_attributes_for :index_card

    # delegate :full_name, :nickname, :family_name, :given_name, :additional_name, :honorific_prefix, :honorific_suffix, to: :vcard
    # delegate :full_name=, :nickname=, :family_name=, :given_name=, :additional_name=, :honorific_prefix=, :honorific_suffix=, to: :vcard


    # Access restrictions
    if defined?(ActiveModel::MassAssignmentSecurity)
      attr_accessible :full_name, :nickname, :family_name, :given_name, :honorific_prefix, :honorific_suffix,
                      :vcard_attributes, :vcards_attributes
    end
  end
end
