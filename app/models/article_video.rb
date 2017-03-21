class VideoValidator < ActiveModel::Validator
  def validate(record)
    if (!['Youtube', 'Vimeo'].include? record.info.provider)
      record.errors[:base] << "Only Youtube and Vimeo are supported."
    end
    if (!record.info.available?)
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

  def cover_image_url
    if (image?)
      image.url(:large)
    # elsif (video_info.provider == 'Vimeo' and (pictures = video_info.data['pictures']))
    #   pictures['sizes'].last['link']
    else
      video_info.thumbnail_large
    end
  end

  def video_info
    @video_info ||= VideoInfo.new(video_url)
  end
end