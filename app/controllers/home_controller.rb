class HomeController < ApplicationController
  def index
    @talents = Talent.recent
  end
end
