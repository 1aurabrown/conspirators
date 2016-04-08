module TagNetworkable
  extend ActiveSupport::Concern

  included do
    attr_accessor :network_models
    attr_accessor :similar
    attr_accessor :tag_networkable_contexts

    def compute_similarities_by(contexts)
      self.tag_networkable_contexts = contexts
      self.similar = {}
      contexts.each do |context|
        self.network_model_init(context)
      end
      similar_raw = {}

      self.network_models.values.each do |network_model|
        network_model.each_pair do |sibling, model|
          if (similar_raw[sibling])
            similar_raw[sibling].push model[:normalized]
          else
            similar_raw[sibling] = [model[:normalized]]
          end
        end
      end
      similar_raw.each_pair do |key, value|
        self.similar[key] = value.reduce(0, :+) / self.tag_networkable_contexts.length
      end
      self.similar
    end

    def network_model_init(context)
      self.network_models ||= {}
      self.network_models[context] ||= 
        (TagNetwork.new(context, self)).sibling_similarities 
    end
  end
end