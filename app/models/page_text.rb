class PageText < ActiveRecord::Base
  validates_presence_of [:page, :text]
  enum page: [:footer, :contact_talents, :contact_business, :favourites]
  def formatted_text
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(self.text).html_safe

  end

  rails_admin do
    navigation_label 'Admin'
    navigation_icon "fa-edit"

    edit do
      field :page
      field :text do 

        partial 'markdown_partial'
      end
    end
    show do
      field :page
      field :text do
        formatted_value do 
          bindings[:object].formatted_text
        end
      end
    end
  end
end
