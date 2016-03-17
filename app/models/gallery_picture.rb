class GalleryPicture < ActiveRecord::Base
  belongs_to :talent
  has_attached_file :image, styles: { large: "600>", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image,  :content_type => ["image/jpg", "image/jpeg", "image/png" ]
end
