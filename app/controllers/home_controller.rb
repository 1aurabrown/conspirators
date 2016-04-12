class HomeController < ApplicationController
  def index
    @talents = Talent.recent(2)
  end
end
