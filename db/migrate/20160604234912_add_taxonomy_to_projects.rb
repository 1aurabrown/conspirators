class AddTaxonomyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :type, :integer
    add_column :projects, :director, :string
    add_column :projects, :for, :string
  end
end
