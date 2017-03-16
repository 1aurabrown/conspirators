class MediaValidator < ActiveModel::Validator
  def validate(record)
    debugger
    if (record.video? && record.article_video.nil?)
      record.errors[:base] << "Video media type was selected, but no video was provided."
    elsif (record.images? && !record.article_images.any?)
      record.errors[:base] << "Images media type was selected, but no images were provided."
    end
  end
end

class Article < ActiveRecord::Base
  validates_uniqueness_of :featured, if: :featured
  validates_presence_of :title, :content, :media_type

  validates_with MediaValidator

  has_one :article_video, inverse_of: :article, foreign_key: :article_id, dependent: :destroy
  accepts_nested_attributes_for :article_video

  has_many :article_images, inverse_of: :article, foreign_key: :article_id, dependent: :destroy
  accepts_nested_attributes_for :article_images

  scope :featured, -> { where(featured: true) }
  scope :published, -> { where.not(published_at: nil) }

  enum media_type: [ :video, :images ]

  rails_admin do
    navigation_label 'News'

    configure :published_at do
      hide
    end

    show do
      field :media_type
      field :featured
      field :published
      field :title
      field :subtitle
      field :content
    end

    edit do
      group :media do
        help 'Provide either a Video or Images to be displayed at the top of the article.'
        field :media_type, :enum
        field :article_video do
          help 'Provide a video and optional cover image'
        end
        field :article_images do
          help 'Provide one or more images'
        end
      end

      group :copy do
        label 'Article Copy'
        field :title
        field :subtitle
        field :content, :wysihtml5 do
          config_options toolbar: { fa: true }
        end
      end

      group :settings do
        field :slug do
          help 'Provide a custom slug if desired, otherwise post title will be used.'
        end
        field :featured do
          help 'Only one article is featured at a time. Featuring this article will unfeature the current featured article.'
        end
        field :published, :toggle
      end
    end

    list do
      field :title
      field :content do
        pretty_value do
          sanitizer = Rails::Html::WhiteListSanitizer.new
          sanitizer.sanitize(value).html_safe
        end
      end
      field :published
      field :featured
    end
  end

  def published=(value)
    if(value == "1")
      if(published_at.nil?)
        published_at = Time.now
      end
    else
      published_at = nil
    end
  end

  def featured=(value)
    if (value == '1')
      self.class.base_class.where('id != ? and featured', self.id).update_all("featured = 'false'")
    end
    write_attribute(:featured, value)
  end

  def published
    !published_at.nil?
  end
end
