class Note < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  validates_presence_of [:contactable, :content]
  def formatted_text
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(self.content).html_safe
  end

  def date
    "#{self.created_at.to_formatted_s(:short) } (#{ActionController::Base.helpers.time_ago_in_words(self.created_at)} ago)"
  end


  rails_admin do
    navigation_label 'Talents'
    field :contactable do
      label "Note about:"
    end

    field :content
    edit do
      configure :date do
        read_only true
        help ""
      end
    end
    show do
      configure :content do
        formatted_value do 
          bindings[:object].formatted_text
        end
      end
    end
  end
end
