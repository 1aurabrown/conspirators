class TalentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:add_to_collection]

  def show
    @talent = Talent.find_by slug: params[:slug]
    @columns = @talent.gallery_pictures.reduce([[],[],[]]) do |columns, pic|
      next if (col = columns[pic.col - 1]).length >= 2
      col.push pic
      columns
    end

    @title = "#{@talent.name} / #{@talent.genders.join(' / ')} / #{@talent.skills.join(' / ')} "
    @og_image = @talent.avatar.url
  end

  def favourites
    @saved_talents = current_user.saved_talents
    @page_text = PageText.faves.first.formatted_text
  end

  def edit_collection
    talent = Talent.find_by slug: params[:id]
    if current_user.saved_for_later? talent
      current_user.remove_from_saved talent
    else
      current_user.save_for_later talent
    end

    response = {
      talent: talent,
      saved: current_user.saved_for_later?(talent),
      totalSaved: current_user.saved_talents_num
    }
    respond_to do |format|
      format.json { render json: response }
    end
  end

  protected

  def json_request?
    request.format.json?
  end
end
