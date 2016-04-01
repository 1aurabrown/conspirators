module TagNetworkable
  extend ActiveSupport::Concern

  included do
    def similarities_by(context)
      weights = GraphWeight.for(self.class.name, context)
      tag_weights = {} 
      sibling_similarities = {}
      tags = self.tags_on(context)
      tags.each do |tag|
        tag_weights[tag.id] = weights.tag_weights[tag.id.to_s].to_r
      end
      self.send("find_sibling_on_#{context}").each do |sibling|
        sibling_tags = sibling.tags_on(context)
        common_tags = tags & sibling_tags
        sibling_score_normaliser = sibling_tags.length + tags.length
        sibling_similarities[sibling.id] = {
          tags: common_tags.map do |tag|
            { 
              id: tag.id,
              name: tag.name, 
              score: tag_weights[tag.id]
            }
          end
        }
      end
      return sibling_similarities
    end
  end
end