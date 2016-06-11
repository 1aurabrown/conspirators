class HomeController < ApplicationController
  def index
    @talents = Talent.order(popularity: :desc).recent
      @tags = Tag.where(acceptable: true)
    
    gon.tags = Talent.recent.map do |talent|
      {id: talent.id, tags: talent.acceptable_tags.to_ary }
    end
  end
end
