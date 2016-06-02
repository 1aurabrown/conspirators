class FeaturedProject < ActiveRecord::Base
  belongs_to :talent, inverse_of: :featured_projects
  belongs_to :project
  validates_presence_of :talent, :project
  rails_admin do
    hide

  end
end
