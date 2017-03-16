class ArticleVideo < ActiveRecord::Base
  has_attached_file :image, {
    styles: { large: "600>", medium: "300>", thumb: "100x100#" },
    default_url: "/images/:style/missing.png"
  }
  belongs_to :article, inverse_of: :article_video
  validates_attachment_content_type :image,  :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates_presence_of :article, :video_url
  rails_admin do
    hide
  end
end