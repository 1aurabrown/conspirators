require 'carrierwave'

Lines::ApplicationController.class_eval do
  helper ApplicationHelper

  def current_lines_user
    current_user if current_user.admin?
  end

  def current_user
    @current_user ||= super || Guest.new(cookies.signed)
  end

  def authorize
    authenticate_user!
    throw(:warden) unless current_user.admin?
  end
end

storage = Rails.env.production? :fog : :file
DocumentUploader.storage storage
ImageUploader.storage storage
PictureUploader.storage storage
