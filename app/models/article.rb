class MediaValidator < ActiveModel::Validator
  def validate(record)
    if (!record.article_images.any? && record.video_url.length)
      record.errors[:base] << "Please provide either at least one Image or a Video URL"
    elsif (record.article_images.any? && !record.video_url.length && record.media_type.nil?)
      record.errors[:base] << "Images and Video Link were provided. You must indicate which to use with Media Type."
    end
  end
end

class Article < ActiveRecord::Base
  has_many :article_images, dependent: :destroy, inverse_of: :article
  validates_uniqueness_of :featured, if: :featured
  accepts_nested_attributes_for :article_images, allow_destroy: true
  validates_presence_of :title, :content
  validates_with MediaValidator
  enum media_type: [:video, :images]

  rails_admin do
    navigation_label 'News'

    configure :published_at do
      hide
    end

    edit do
      group :copy do
        label 'Article Copy'
        field :title
        field :content
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

      group :media do
        help 'Provide either a Video URL or Images to be displayed at the top of the article.'

        field :media_type do
          help 'Indicate whether to use Photos or Video in the header if both have been included.'
        end
        field :video_url do
        end
        field :article_images do
          label 'Images'
          visible true
          active true
        end
      end
    end

    list do
      field :title
      field :media_type
      field :published
      field :featured
    end
  end

  def published=(value)
    if value == true && published_at.nil?
      published_at = Time.now
    else
      published_at = nil
    end
  end

  def published
    !published_at.nil?
  end
end

