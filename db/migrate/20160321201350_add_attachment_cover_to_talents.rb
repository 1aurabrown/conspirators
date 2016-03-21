class AddAttachmentCoverToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :talents, :cover
  end
end
