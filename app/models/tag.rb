class Tag < ActiveRecord::Base
  before_save :set_slug

  def set_slug
    if self.slug.blank?
      self.slug = self.name.parameterize
    end
  end
  rails_admin do
    navigation_label 'Talents'
    field :name do
      read_only true
      label "Tag"
      help ""
    end

    field :acceptable, :toggle
  end
end