class ArticleVideo < ActiveRecord::Base
  has_attached_file :image, {
    styles: { large: "600>", medium: "300>", thumb: "100x100#" },
    default_url: "/images/:style/missing.png"
  }
  belongs_to :article, inverse_of: :article_video
  validates_attachment_content_type :image,  :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates_presence_of :article, :video_url
  validate :validate_provider
  rails_admin do
    hide
  end

  def validate_provider
    begin
      if (!['YouTube', 'Vimeo'].include? oembed.provider_name)
        errors[:video_url] << "Only Youtube and Vimeo are supported."
      end
    rescue
      errors[:video_url] << "Video is not available or URL is incorrect."
    end
  end

  def cover_image_url
    if (image?)
      image.url(:large)
    else
      oembed.thumbnail_url
    end
  end

  def oembed
    @oembed ||= OEmbed::Providers.get(video_url)
  end
end