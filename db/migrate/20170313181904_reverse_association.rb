class ReverseAssociation < ActiveRecord::Migration
  def up
    change_table :articles do |t|
      t.references :media, {
        index: true,
        polymorphic: true
      }
    end
    change_table :article_attachments do |t|
      t.remove_references :article, {
        foreign_key: true,
        index: true
      }
    end
  end

  def down
    change_table :articles do |t|
      t.remove_references :media, {
        index: true,
        polymorphic: true
      }
    end
    change_table :article_attachments do |t|
      t.references :article, {
        foreign_key: true,
        index: true
      }
    end
  end
end
