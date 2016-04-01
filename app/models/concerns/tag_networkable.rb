module TagNetworkable
  extend ActiveSupport::Concern

  included do 

    def tag_weights(context)

    end

    def context_tag_weight(tag_id, tag_context)
      tag_counts_node = self.tag_counts_on(context)
      most_popular_node = tag_counts_node.maximum(:taggings_count)
      most_popular_overall = self.most_popular_for_context(context)
      return most_popular_node / most_popular_overall
    end

    # TagNetworkable-independent
    def tag_weight(tag_id, context)

    end


    # TagNetworkable-dependant
    def node_context_weight(context)
      self.tags_on(context).count / self.most_tags_per_node_in(context)
    end

    def most_tags_per_node_in(context)
      max_tuple = ActsAsTaggableOn::Tagging
        .where(taggable_type: "Talent")
        .where(context: :context)
        .group(:taggable_id)
        .count
        .max_by { | taggable_id, nodes | nodes }
      return max_tuple[1]
    end
  end
end