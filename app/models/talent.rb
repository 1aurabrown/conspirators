class Talent < ActiveRecord::Base
  include Allport::Concerns::Contactable
  enum gender: [ :masculine, :feminine, :unknown ]
  has_attached_file :avatar, styles: { large: "600>", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar,  :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :resume, styles: { thumb: "60x60>" }
  validates_attachment_content_type :resume, content_type: "application/pdf"
  has_many :gallery_pictures, inverse_of: :talent

  def name
    "#{self.first_name} #{self.last_name}"
  end

  rails_admin do
    navigation_label 'Talents'
    weight -1
    list do
      field :name do
        searchable [:first_name, :last_name]
        queryable true
        filterable true
      end
      field :gender do
        filterable true
      end
      field :avatar do
        filterable false
      end
    end
    group :base do
      label "Basic information"
      field :first_name
      field :middle_name
      field :last_name
      field :email
      field :gender
      field :avatar
    end
    group :uploads do
      label "Uploads"
      field :resume
      field :gallery_pictures do
       inverse_of :talent
      end
    end
  end
end
