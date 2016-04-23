module Guests
  class SavedTalents
    include Enumerable

    delegate :each, to: :to_ary

    def initialize(store)
      @store = store
    end

    def include?(talent)
      ids.include?(talent.id)
    end

    def <<(talent)
      @store[:saved_for_later] = JSON.generate(ids << talent.id)
    end

    # Is called by ActionView when rendering a collection
    def to_ary
      talent.where(id: ids).map do |talent|
        Guests::Savedtalent.new(self, talent)
      end
    end

    def destroy
      @store[:saved_for_later] = nil
    end

    private

    def ids
      return [] unless @store[:saved_for_later]

      JSON.parse(@store[:saved_for_later])
    end

  end
end