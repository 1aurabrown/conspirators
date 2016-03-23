class TalentsController < ApplicationController
  def show
    @talent = Talent.find(params[:id])
  end
end
