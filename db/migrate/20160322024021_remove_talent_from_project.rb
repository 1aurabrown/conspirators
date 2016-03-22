class RemoveTalentFromProject < ActiveRecord::Migration
  def change
    remove_reference :projects, :talent, index: true, foreign_key: true
  end
end
