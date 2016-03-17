class AddAttachmentAvatarToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :talents, :avatar
  end
end
