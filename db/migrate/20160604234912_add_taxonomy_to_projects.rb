class AddTaxonomyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_type, :integer, default: 9
    add_column :projects, :director, :string
    add_column :projects, :for, :string
    add_column :projects, :link, :string

  end
end
