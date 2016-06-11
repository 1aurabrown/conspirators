class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  helper_method :impressum

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.new_user_session_path, :alert => exception.message
  end

  def impressum
    PageText.find_by(page: :footer).formatted_text
  end

  def after_sign_in_path_for(resource)
    '/admin'
  end

  def current_user
    super || guest_user
  end

  private

  def guest_user
    @guest ||= Guest.new(cookies.signed)
  end

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
