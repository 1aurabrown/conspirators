module ApplicationHelper
  def saved?(talent)
    current_user.saved_for_later? talent
  end

  def saved_talents_num()
    current_user.saved_talents.to_ary.length
  end
end
