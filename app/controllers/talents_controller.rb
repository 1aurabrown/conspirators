class TalentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:add_to_collection]
  
  def show
    @talent = Talent.find_by slug: params[:slug]
  end

  def saved

  end

  def add_to_collection
    talent = Talent.find_by slug: params[:id]
    current_user.save_for_later talent
    respond_to do |format|
      format.json { render json: talent }
    end
  end

  protected

  def json_request?
    request.format.json?
  end
end
