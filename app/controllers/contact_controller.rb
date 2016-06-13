class ContactController < ApplicationController
  def index
    @general = PageText.contact_general.first.formatted_text
    @agencies = PageText.contact_agencies.first.formatted_text
    @talents = PageText.contact_talents.first.formatted_text
  end
end
