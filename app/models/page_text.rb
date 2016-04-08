class PageText < ActiveRecord::Base
  validates_presence_of [:title, :text]
  rails_admin do
    navigation_label 'Admin'
  end
end
