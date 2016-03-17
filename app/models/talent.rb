class Talent < ActiveRecord::Base
  include Allport::Concerns::Contactable
  enum gender: [ :masculine, :feminine, :unknown ]

end
