class Project < ActiveRecord::Base
  belongs_to :talent
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true


  rails_admin do
    navigation_label 'Talents'
    weight -1
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'
        ratl_max_suggestions -1
      end
    list do
      field :title do
        searchable [:first_name, :last_name]
        queryable true
        filterable true
      end
      field :date
    end
    field :title
    field :description
    field :date
    field :talent do
     inverse_of :project
    end
  end
end
