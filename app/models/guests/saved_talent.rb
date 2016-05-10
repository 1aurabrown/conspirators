module Guests
  class SavedTalent
    attr_reader :guest, :talent

    def initialize(guest, talent)
      @guest, @talent = guest, talent
    end

  end
end