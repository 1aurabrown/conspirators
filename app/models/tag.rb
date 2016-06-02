class Tag < ActiveRecord::Base
  rails_admin do
    navigation_label 'Talents'
    list do
      field :name do
        read_only true
        label "Tag"
        help ""
      end

      field :acceptable, :toggle
    end
  end
end