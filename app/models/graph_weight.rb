class GraphWeight < ActiveRecord::Base
  serialize :tag_weights, JSON
  serialize :node_context_weights, JSON
  attr_accessor :contextual_taggings

  def self.for(taggable_class, context)
    GraphWeight.where({taggable_class: taggable_class, context: context}).first_or_create
  end

  def refresh!
    refresh_max_tags
    if self.max_tags
      refresh_tag_weights    
      save!
    end
  end

  def taggings
    self.contextual_taggings ||= ActsAsTaggableOn::Tagging
      .where(taggable_type: self.taggable_class)
      .where(context: self.context)
    self.contextual_taggings.dup
  end

  # Maximum number of tags owned by anyone of Type in a given context
  def refresh_max_tags
    max_tuple = self.taggings
      .group(:taggable_id)
      .count
      .max_by { | taggable_id, nodes | nodes }
    if max_tuple
      self.max_tags = max_tuple[1] 
    else
      self.max_tags = nil
    end
  end

  def refresh_tag_weights
    tag_ids = self.taggings.pluck('DISTINCT tag_id')
    temp_tag_weights = {}
    tag_ids.each do |tag_id|
      temp_tag_weights[tag_id] = tag_weight(tag_id)
    end
    self.tag_weights = temp_tag_weights
  end


  def tag_weight(tag_id)
    total_tagged = self.taggings
      .where(tag_id: tag_id)
      .count()
    self.taggable_class.constantize.count / total_tagged 
  end

  rails_admin do 
    visible false
  end
end
