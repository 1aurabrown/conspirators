class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
    @page_text = text.formatted_text if text = PageText.collaborators.first
  end
end