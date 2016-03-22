class AddOrganisedByConspiratorsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :organised_by_conspirators, :boolean
  end
end
