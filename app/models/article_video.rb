class VideoValidator < ActiveModel::Validator
  def validate(record)
    video = VideoInfo.new(record.video_url)
    if (!['Youtube', 'Vimeo'].include? video.provider)
      record.errors[:base] << "Only Youtube and Vimeo are supported."
    end
    if (!video.available?)
      record.errors[:base] << "Video is not available or URL is incorrect."
    end
  end
end
class ArticleVideo < ActiveRecord::Base
  has_attached_file :image, {
    styles: { large: "600>", medium: "300>", thumb: "100x100#" },
    default_url: "/images/:style/missing.png"
  }
  belongs_to :article, inverse_of: :article_video
  validates_attachment_content_type :image,  :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates_presence_of :article, :video_url
  validates_with VideoValidator
  rails_admin do
    hide
  end
end