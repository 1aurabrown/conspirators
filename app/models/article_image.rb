class ArticleImage < ActiveRecord::Base
  has_attached_file :image, {
    styles: { xlarge: "1200x800>" },
    default_url: "/images/:style/missing.png"
  }

  has_one :article_where_featured, inverse_of: :featured_image, class_name: 'Article'
  belongs_to :article, inverse_of: :article_images
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates_attachment_presence :image
  validates_presence_of :article

  def article= (article)
    if @@article != article && @@article.featured_image == self
      @@article.featured_image = nil
      @@article.save
    end
    super
  end

  def featured=(value)
    if value == '1' or value == true
      @temp_featured = true
    else
      @temp_featured = false
    end
  end

  def temp_featured
    @temp_featured
  end

  def featured
    self.article ? self.article.featured_image == self : false
  end

  rails_admin do
    hide
    edit do
      field :image
      field :featured, :boolean
    end
  end
end