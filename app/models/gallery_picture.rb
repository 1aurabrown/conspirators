class GalleryPicture < ActiveRecord::Base
  belongs_to :talent
  has_attached_file :image, styles: { large: "600>", medium: "300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image,  :content_type => ["image/jpg", "image/jpeg", "image/png" ]
  validates :talent, presence: true
  validates :image, presence: true
  enum position: [:col1_1, :col1_2, :col2_1, :col2_2, :col3_1, :col3_2]
  default_scope { order(:position) } 

  def name
    if self.talent
      "#{self.talent.first_name} #{self.position.to_s}"
    else
      "Unassigned ##{self.id}"
    end
  end

  def col
    self.position.to_s[3].to_i
  end

  rails_admin do
    navigation_label 'Talents'
  end 
end
