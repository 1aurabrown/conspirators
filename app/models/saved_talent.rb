class SavedTalent < ActiveRecord::Base
  belongs_to :talent
  belongs_to :user

  scope :for_talent, lambda { |talent| where(talent_id: talent) }
  rails_admin do
    hide
  end
end