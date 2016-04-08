class PageText < ActiveRecord::Base
  validates_presence_of [:title, :text]

  def formatted_text
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(self.text).html_safe

  end

  rails_admin do
    navigation_label 'Admin'
    show do
      field :title
      field :text do
        formatted_value do 
          bindings[:object].formatted_text
        end
      end
    end
  end
end
