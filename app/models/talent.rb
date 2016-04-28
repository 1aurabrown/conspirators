class Talent < ActiveRecord::Base
  include Allport::Concerns::Contactable
  include TagNetworkable
  publishable
  
  has_many :featured_projects, dependent: :destroy, inverse_of: :talent
  has_and_belongs_to_many :projects, inverse_of: :talent
  has_attached_file :avatar, styles: { large: "600>", medium: "200x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar,  :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :resume, styles: { thumb: "60x60>"}
  validates_attachment_content_type :resume, content_type: "application/pdf"
  has_attached_file :cover, styles: { large: "x600" }
  validates_attachment_content_type :cover, content_type: ["image/jpg", "image/jpeg", "image/png" ] 
  has_many :gallery_pictures, inverse_of: :talent
  accepts_nested_attributes_for :gallery_pictures, :allow_destroy => true
  has_many :spoken_languages, inverse_of: :talent
  validates_numericality_of :age, :in => 1..99
  validates_numericality_of :height, :in => 1..220
  acts_as_taggable_on :skills, :languages, :genders, :types
  has_many :notes, as: :contactable, dependent: :destroy
  before_save :set_slug, :refresh_weights
  accepts_nested_attributes_for :featured_projects, :allow_destroy => true



  def country_code_enum
    Country.all_translated
  end

  def name
    "#{self.first_name} #{self.last_name ? " " : ''}#{self.last_name}"
  end

  def set_slug
    if self.slug.blank?
      self.slug = self.name.parameterize
    end
  end

  def appearance
    [ 
      self.genders.pluck(:name).to_sentence,
      "#{self.height_in}"
    ].join(' / ')
  end

  def get_similar
    similar_obj = self.compute_similarities_by([:skills, :genders, :types])
    Talent.where(id: similar_obj.keys.first).where("published < ?", Date.today).limit(4)
  end

  def refresh_weights
    [:skills, :genders, :types].each do |context|
      g = GraphWeight.new taggable_class: "Talent", context: context
      g.refresh!
    end   
  end

  def height_in(unit=:cm)
    return nil unless self.height
    Unit.new("#{self.height} cm").to_s(unit)
  end

  rails_admin do
    navigation_label 'Talents'
    weight -1
    fields_of_type :tag_list do
      partial 'tag_list_with_suggestions'
      ratl_max_suggestions -1
    end
    edit do
      field :published do
        label "Public from"
      end
      group :base do
        label "Basic information"
        field :first_name
        field :middle_name
        field :last_name
        field :country_code do
          label "Country"
        end
        field :email
        field :avatar
      end
      group "Skills and projects" do
        field :skill_list
        field :language_list
        field :featured_projects
      end
      group "Appearence" do

        field :type_list do
          label "Type"
        end
        field :gender_list do
          label "Gender"
        end
        field :age
        field :height do
          help 'Required, in cm'
        end
      end
      group :uploads do
        label "Uploads"
        field :resume
        field :cover do
          help "The image will be resized to 1600x800."
        end
        field :gallery_pictures
      end
    end
    list do
      field :name do
        searchable [:first_name, :last_name]
        queryable true
        filterable true
        formatted_value do
          bindings[:view].link_to(bindings[:object].name, "/#{bindings[:object].slug}")
        end
      end
      field :published do 
        pretty_value do
          bindings[:object].published.blank? ? "No" : "Yes" 
        end
      end
      field :gender_list do
        label "Gender"
      end
      field :type_list do
        label "Type"
      end
      field :avatar do
        filterable false
      end
    end
    show do
      field :name
      field :appearance
      field :avatar
      field :skills
      field :languages
      field :projects
      field :resume
      field :cover
      field :gallery_pictures do
        pretty_value do
          pics = bindings[:object].gallery_pictures.map do |pic|
            bindings[:view].tag(:img, { :src => pic.image.url(:thumb) })
          end
          pics.reduce(:+).html_safe
        end
      end
    end
  end
end
