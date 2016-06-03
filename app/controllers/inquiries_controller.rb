class InquiriesController < ApplicationController
  def create


    permitted = params.permit(:name, :email, :talents)
    inquiry = Inquiry.create!(permitted) 
    respond_to do |format|
      format.json { render json: inquiry }
    end
  end

  protected

  def json_request?
    request.format.json?
  end
end
