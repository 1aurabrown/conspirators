class AddAttachmentResumeToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :talents, :resume
  end
end
