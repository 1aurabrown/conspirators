module TagNetworkable
  extend ActiveSupport::Concern

  included do
    attr_accessor :network_models

    def compute_similarities_by(context)
      self.network_model_init(context)
    end

    def network_model_init(context)
      self.network_models ||= {}
      self.network_models[:context] ||= (TagNetwork.new(context, self))
        .sibling_similarities
    end
  end
end