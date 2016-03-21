class GalleryPicture < ActiveRecord::Base
  belongs_to :talent, inverse_of: :gallery_pictures
  has_attached_file :image, styles: { large: "600>", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image,  :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates :talent, presence: true
  validates :image, presence: true

  def name
    if self.talent
      "#{self.talent.first_name} ##{self.id}"
    else
      "Unassigned ##{self.id}"
    end
  end

  rails_admin do
    navigation_label 'Talents'
  end 
end
