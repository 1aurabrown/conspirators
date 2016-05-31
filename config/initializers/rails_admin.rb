RailsAdmin.config do |config|

  config.authorize_with :cancan
  config.current_user_method(&:current_user)


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    toggle
  end

  config.excluded_models << "HasVcards::Vcard"
  config.excluded_models << "HasVcards::Address"


  config.excluded_models << "HasVcards::PhoneNumber"
end
