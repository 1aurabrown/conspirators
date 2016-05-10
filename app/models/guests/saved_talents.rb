module Guests
  class SavedTalents
    include Enumerable

    delegate :each, to: :to_ary

    def initialize(store)
      @store = store
    end

    def include?(talent)
      slugs.include?(talent.slug)
    end

    def <<(talent)
      @store[:saved_for_later] = JSON.generate(slugs << talent.slug)
    end

    def to_ary
      Talent.where(slug: slugs).map do |talent|
        Guests::SavedTalent.new(self, talent)
      end
    end

    def delete(talent)
      @store[:saved_for_later] = JSON.generate(slugs - [slug])
    end

    def destroy
      @store[:saved_for_later] = nil
    end

    private

    def slugs
      return [] unless @store[:saved_for_later]

      JSON.parse(@store[:saved_for_later])
    end

  end
end