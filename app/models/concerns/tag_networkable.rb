module TagNetworkable
  extend ActiveSupport::Concern

  included do 


    def context_weight(context)
      tag_counts_node = self.tag_counts_on(context)
      most_popular_node = tag_counts_node.maximum(:taggings_count)
      most_popular_overall = ActsAsTaggableOn::Tag.most_used(1).first.taggings_count
      return most_popular_node / most_popular_overall
    end
  end
end