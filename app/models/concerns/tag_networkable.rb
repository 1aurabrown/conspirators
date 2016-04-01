module TagNetworkable
  extend ActiveSupport::Concern

  included do 

    def tag_weights(context)

    end

    def context_tag_weight(tag_id, tag_ context)
      tag_counts_node = self.tag_counts_on(context)
      most_popular_node = tag_counts_node.maximum(:taggings_count)
      most_popular_overall = self.most_popular_for_context(context)
      return most_popular_node / most_popular_overall
    end

    def context_weight(context)

    end

    def most_popular_for_context(context)
      ActsAsTaggableOn::Tag.joins(:taggings)
        .where(["taggings.context = ?", context])
        .select("DISTINCT tags.*")
        .most_used(1).first.taggings_count
    end
  end
end