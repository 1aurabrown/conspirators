class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
    @use_small_footer = true
    if !(text = PageText.collaborators.first).nil?
      @page_text = text.formatted_text
    end
  end
end