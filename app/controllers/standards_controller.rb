class StandardsController < ApplicationController
  # GET /standards
  # GET /standards.json
  def index
    @standards = Standard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @standards }
    end
  end
end
