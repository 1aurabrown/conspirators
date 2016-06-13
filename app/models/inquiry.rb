class Inquiry < ActiveRecord::Base

  validates_presence_of :name, :email
  rails_admin do
    navigation_label 'Admin'
    configure :answered, :toggle
  end
end
