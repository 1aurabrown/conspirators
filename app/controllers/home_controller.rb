class HomeController < ApplicationController
  def index
    @talents = Talent.recent
    @tags = Tag.where(acceptable: true)
    render "temp"
  end
end
