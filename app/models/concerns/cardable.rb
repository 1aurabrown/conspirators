module Cardable
  extend ActiveSupport::Concern

  included do
    # Single/Main vcard
    has_one :index_card, as: 'reference',  autosave: true
    accepts_nested_attributes_for :index_card

    delegate :contacts, :name, :family_name, :given_name, :additional_name, to: :index_card, allow_nil: true
    delegate :contacts=, :family_name=, :given_name=, :additional_name=, to: :index_card, allow_nil: true

    before_create :make_index_card

    def make_index_card
      self.create_index_card(
        reference: self
      )
    end

  end
end
