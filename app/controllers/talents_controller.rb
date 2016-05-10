class TalentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:add_to_collection]
  
  def show
    @talent = Talent.find_by slug: params[:slug]
  end

  def saved

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
      saved: current_user.saved_for_later?(talent)
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
