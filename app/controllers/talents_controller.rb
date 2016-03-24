class TalentsController < ApplicationController
  def show
    @talent = Talent.find_by slug: params[:slug]
  end
end
