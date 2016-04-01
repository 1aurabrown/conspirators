module TagNetworkable
  extend ActiveSupport::Concern

  included do 

    # TagNetworkable-independent
    def tag_weight(tag_id, context)
      total_tagged = ActsAsTaggableOn::Tagging
        .where(taggable_type: self.class.name)
        .where(tag_id: tag_id)
        .distinct
        .count(:taggable_id)
      self.class.count / total_tagged 
    end


    # TagNetworkable-dependant
    def node_context_weight(context)
      self.tags_on(context).count / self.most_tags_per_node_in(context)
    end

    def most_tags_per_node_in(context)
      max_tuple = ActsAsTaggableOn::Tagging
        .where(taggable_type: self.class.name)
        .where(context: :context)
        .group(:taggable_id)
        .count
        .max_by { | taggable_id, nodes | nodes }
      return max_tuple[1]
    end
  end
end