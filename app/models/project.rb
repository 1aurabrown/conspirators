class Project < ActiveRecord::Base
  has_and_belongs_to_many :talents
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  
  scope :by_year, -> {
    order(date: :desc).group_by{ |item| item.date.year } 
  }

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
      field :organised_by_conspirators
    end
    field :title
    field :description
    field :organised_by_conspirators
    field :date
    field :talents
  end
end
