class SpokenLanguage < ActiveRecord::Base
  belongs_to :talent
  rails_admin do
    visible false
  end
end
