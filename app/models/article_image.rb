class ArticleImage < ActiveRecord::Base
  has_attached_file :image, {
    styles: { large: "600>", medium: "300>", thumb: "100x100#" },
    default_url: "/images/:style/missing.png"
  }
  belongs_to :article, inverse_of: :article_images
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates_attachment_presence :image

  rails_admin do
    hide
  end
end