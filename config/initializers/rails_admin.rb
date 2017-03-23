require Rails.root.join('lib', 'rails_admin', 'feature.rb').to_s
RailsAdmin.config do |config|

  config.authorize_with :cancan
  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['AddressBookEntry']
    end
    feature do
      only ['Article', 'ArticleImage']
    end
    unfeature do
      only ['Article', 'ArticleImage']
    end
    export
    bulk_delete
    show
    edit
    delete
    toggle
  end
end
