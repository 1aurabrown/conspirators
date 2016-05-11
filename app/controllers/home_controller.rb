class HomeController < ApplicationController
  def index
    @talents = Talent.recent
    @tags = Tag.where(acceptable: true)
  end
end
