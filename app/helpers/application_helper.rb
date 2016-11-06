module ApplicationHelper
  def saved?(talent)
    current_user.saved_for_later? talent
  end

  def saved_talents_num()
    current_user.saved_talents.to_ary.length
  end

  def impressum
    PageText.footer.first.formatted_text
  end

  def seo_description
    PageText.SEO_about.first.text
  end
end
