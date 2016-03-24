class Talent < ActiveRecord::Base
  include Allport::Concerns::Contactable
  has_and_belongs_to_many :projects
  has_attached_file :avatar, styles: { large: "600>", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar,  :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :resume, styles: { thumb: "60x60>" }
  validates_attachment_content_type :resume, content_type: "application/pdf"
  has_attached_file :cover, styles: { large: "x600" }
  validates_attachment_content_type :cover, content_type: ["image/jpg", "image/jpeg", "image/png" ] 
  has_many :gallery_pictures, inverse_of: :talent
  accepts_nested_attributes_for :gallery_pictures, :allow_destroy => true

  validates_numericality_of :age, :in => 1..99
  validates_numericality_of :height, :in => 1..220
  acts_as_taggable_on :skills, :languages, :gender

  def name
    "#{self.first_name} #{self.last_name ? " " : ''}#{self.last_name}"
  end

  def appearance
    [ self.gender.to_sentence, self.age, self.height].reject!(&:blank?).join(' / ')
  end

  rails_admin do
    navigation_label 'Talents'
    weight -1
    fields_of_type :tag_list do
      partial 'tag_list_with_suggestions'
      ratl_max_suggestions -1
    end
    edit do
      group :base do
        label "Basic information"
        field :first_name
        field :middle_name
        field :last_name
        field :email
        field :avatar
      end
      group "Skills and projects" do
        field :skill_list
        field :language_list
        field :projects do
          inverse_of :talents
        end
      end
      group "Appearence" do 
        field :gender
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
      end
      field :gender
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
      field :gallery_pictures
    end
  end
end
