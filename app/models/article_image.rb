class ArticleImage < ActiveRecord::Base
  belongs_to :article, inverse_of: :article_images
  has_attached_file :image, styles: { large: "600>", medium: "300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png" ]
  validates_uniqueness_of :featured, if: :featured
  validates :article, presence: true
  validates :image, presence: true

  rails_admin do
    hide
  end
end