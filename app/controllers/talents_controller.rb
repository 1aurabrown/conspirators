class TalentsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  
  def show
    @talent = Talent.find_by slug: params[:slug]
  end

  def saved

  end

  def add_to_collection
    talent = Talent.find_by slug: params[:id]
    current_user.saved_talents << talent
    respond_to do |format|
      format.json { render json: talent }
    end
  end

  protected

  def json_request?
    request.format.json?
  end
end
