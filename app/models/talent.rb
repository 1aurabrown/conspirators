class Talent < ActiveRecord::Base
  include Allport::Concerns::Contactable
  enum gender: [ :masculine, :feminine, :unknown ]
  has_attached_file :avatar, styles: { large: "600>", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar,  :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :resume, styles: { thumb: "60x60>" }
  validates_attachment_content_type :resume, content_type: "application/pdf"
end
