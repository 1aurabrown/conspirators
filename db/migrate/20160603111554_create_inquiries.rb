class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.string :talents
      t.boolean :answered
      t.timestamps null: false

    end
  end
end
