class Project < ActiveRecord::Base
  has_and_belongs_to_many :talents
  has_many :featured_projects
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  enum project_type: [
    :music_video, 
    :short_film, 
    :feature_film, 
    :fashion_shoot,
    :editorial,
    :art_film,
    :performance,
    :installation,
    :tv_series
  ]
  
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
      field :project_type
      field :date do 
        label "Year"
        pretty_value do 
          value.year
        end
      end 
      field :organised_by_conspirators
    end
    field :title
    field :description
    field :project_type
    field :for
    field :director
    field :link
    field :organised_by_conspirators
    field :date
  end
end
