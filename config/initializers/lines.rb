Lines::ApplicationController.class_eval do
  def current_lines_user
    current_user
  end

  def authorize
    authenticate_user!
    throw(:warden) unless current_user.admin?
  end
end
