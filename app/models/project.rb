class Project < ActiveRecord::Base
  has_and_belongs_to_many :talents
  has_many :featured_projects
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  
  scope :by_year, -> {
    order(date: :desc).group_by{ |item| item.date.year } 
  }

  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.title] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| 
        double.featured_projects.delete_all
        double.destroy
      } # duplicates can now be destroyed
    end
  end


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
