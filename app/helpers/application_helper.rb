module ApplicationHelper
  def saved?(talent)
    current_user.saved_for_later? talent
  end

  def saved_talents_num()
    current_user.saved_talents.to_ary.length
  end

  def footers
    {
      default: (d = PageText.footer.first) ? d.formatted_text: nil,
      small: (s = PageText.small_footer.first) ? s.formatted_text : nil
    }
  end

  def has_collaborators
    Collaborator.any?
  end

  def has_articles
    Article.published.any?
  end

  def seo_description
    PageText.SEO_about.first.text
  end
end
