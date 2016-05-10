module ApplicationHelper
  def saved?(talent)
    current_user.saved_for_later? talent
  end
end
