class Inquiry < ActiveRecord::Base
  before_create :set_answered
  validates_presence_of :name, :email
  rails_admin do
    navigation_label 'Admin'
    configure :answered, :toggle
  end
  def set_answered
    self.answered = false
  end
end
