class Guest
  attr_reader :saved_talents

  def initialize(store)
    @saved_talents = Guests::SavedTalents.new(store)
  end

  def registered?
    false
  end

  def destroy
    saved_talents.destroy
  end

  def saved_for_later?(talent)
    saved_talents.for_talent?(talent)
  end

  def save_talent(talent)
    saved_talents.create!(talent)
  end
  
  alias_method :delete, :destroy

end