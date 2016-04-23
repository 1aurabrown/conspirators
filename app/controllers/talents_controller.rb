class TalentsController < ApplicationController
  def show
    @talent = Talent.find_by slug: params[:slug]
  end

  def add_to_saved_talents
    talent = Talent.find(params[:video_id])
    current_user.save_talent(talent)
    respond_to do |format|
      format.json talent
    end
  end
end
