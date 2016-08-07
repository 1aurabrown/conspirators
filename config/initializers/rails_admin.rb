RailsAdmin.config do |config|

  config.authorize_with :cancan
  config.current_user_method(&:current_user)


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do 
      except ['AddressBookEntry']
    end
    export
    bulk_delete
    show
    edit
    delete
    toggle
  end
end
