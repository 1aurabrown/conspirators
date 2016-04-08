module TagNetworkable
  extend ActiveSupport::Concern

  included do
    attr_accessor :network_models
    attr_accessor :tag_networkable_contexts

    def compute_similarities_by(contexts)
      self.tag_networkable_contexts = contexts
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
      similar_raw.map { |k, v| [k, (v.reduce(0, :+) / contexts.length)] }
        .sort_by{ |k, v| v}.reverse.to_h
    end

    def network_model_init(context)
      self.network_models ||= {}
      self.network_models[context] ||= 
        (TagNetwork.new(context, self)).sibling_similarities 
    end
  end
end