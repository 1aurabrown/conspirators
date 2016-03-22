class CreateJoinTableProjectsTalents < ActiveRecord::Migration
  def change
    create_join_table :projects, :talents do |t|
      # t.index [:project_id, :talent_id]
      # t.index [:talent_id, :project_id]
    end
  end
end
