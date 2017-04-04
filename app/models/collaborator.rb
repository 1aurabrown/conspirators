class Collaborator < ActiveRecord::Base
  has_attached_file :logo, {
    styles: {
      small: "150x70>"
    },
    default_url: "/images/:style/missing.png"
  }

  validates_presence_of :name, :url
  validates_attachment_presence :logo
  validates_attachment_content_type :logo, { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  rails_admin do
    navigation_label 'Collaborators'
  end
end
