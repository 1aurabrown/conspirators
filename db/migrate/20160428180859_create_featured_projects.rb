class CreateFeaturedProjects < ActiveRecord::Migration
  def change
    create_table :featured_projects do |t|
      t.references :talent, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
