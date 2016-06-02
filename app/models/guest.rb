class Guest
  attr_reader :saved_talents, :role

  def initialize(store)
    @store = store
    @saved_talents = Guests::SavedTalents.new(@store)
  end

  def registered?
    false
  end

  def destroy
    saved_talents.destroy
  end

  def saved_talents_num
    saved_talents.to_ary.length
  end

  def saved_for_later?(talent)
    saved_talents.include?(talent)
  end

  def save_for_later(talent)
    return if saved_for_later? talent
    saved_talents << talent
  end

  def remove_from_saved(talent)
    return unless saved_for_later? talent
    saved_talents.delete talent
  end

  alias_method :delete, :destroy

end