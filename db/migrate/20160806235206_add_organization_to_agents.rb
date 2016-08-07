class AddOrganizationToAgents < ActiveRecord::Migration
  def change
    add_reference :agents, :organization, index: true, foreign_key: true
  end
end
