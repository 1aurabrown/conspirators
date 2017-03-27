class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
    if !(text = PageText.collaborators.first).nil?
      @page_text = text.formatted_text
    end
  end
end