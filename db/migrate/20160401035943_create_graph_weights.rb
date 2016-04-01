class CreateGraphWeights < ActiveRecord::Migration
  def change
    create_table :graph_weights do |t|
      t.string :context
      t.string :taggable_class
      t.string  :max_tags
      t.text :tag_weights

      t.timestamps null: false
      t.index [:context, :taggable_class]
    end
  end
end
