class ArticleValidator < ActiveModel::Validator
  def validate(record)
    if record.featured_image
      if record.featured_image.article != record
        record.errors[:base] << "Image must first be associated with this article before featuring."
      end
    end

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

  validates_with ArticleValidator

  before_save :before_save

  has_one :article_video, inverse_of: :article, foreign_key: :article_id, dependent: :destroy
  belongs_to :featured_image, class_name: 'ArticleImage', inverse_of: :article_where_featured

  accepts_nested_attributes_for :article_video, allow_destroy: true

  has_many :article_images, inverse_of: :article, foreign_key: :article_id, dependent: :destroy
  accepts_nested_attributes_for :article_images, allow_destroy: true
  validates_associated :article_images, :article_video

  scope :featured, -> { where(featured: true) }
  scope :published, -> { where.not(published_at: nil) }

  enum media_type: [ :video, :images ]

  rails_admin do
    navigation_label 'News'

    show do
      field :media_type, :enum
      field :featured
      field :published
      field :published_at
      field :title
      field :subtitle
      field :content do
        formatted_value do
          bindings[:object].sanitized_content
        end
      end
    end

    edit do
      group :media do
        help 'Provide either a Video or Images to be displayed at the top of the article.'
        field :media_type, :enum
        field :article_video do
          visible true
          active true
          help 'Provide a video and optional cover image'
        end
        field :article_images do
          visible true
          active true
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
        field :featured
        field :published, :boolean
      end
    end

    list do
      field :title
      field :media_type, :enum
      field :content do
        pretty_value do
          sanitizer = Rails::Html::FullSanitizer.new
          sanitizer.sanitize(bindings[:object].content).html_safe.truncate(100)
        end
      end
      field :published, :toggle
      field :featured, :toggle do
        ajax false
      end
      field :published_at
    end
  end

  def published=(value)
    if(value == "1" || value == true)
      if(published_at.nil?)
        publish!
      end
    else
      unpublish!
    end
  end

  def publish!
    return if published
    update_attribute('published_at', Time.now)
  end

  def unpublish!
    return if !published
    update_attribute('published_at', nil)
  end

  def published
    !published_at.nil?
  end

  def cover_image_url
    if video?
      article_video.cover_image_url
    elsif featured_image
      featured_image.image.url(:xlarge)
    else
      article_images.first.image.url(:xlarge)
    end
  end

  def before_save
    set_slug
    update_featured_image
  end

  def update_featured_image
    featured_images = self.article_images.select{|i| i.temp_featured }
    if featured_images.length
      self.featured_image = featured_images.first
    else
      self.featured_image = nil
    end
  end

  def set_slug
    if self.slug.blank?
      self.slug = self.title.slugify
    end
  end

  def sanitized_content
    sanitizer = Rails::Html::WhiteListSanitizer.new
    sanitizer.sanitize(self.content).html_safe
  end

  def featured=(value)
    if value == '1' or value == true
      Article.where('id != ? and featured', self.id).update_all(featured: false)
    end
    super value
  end

  def label
    self.title
  end

  def to_param
    slug
  end
end

