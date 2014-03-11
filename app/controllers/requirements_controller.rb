class RequirementsController < ApplicationController
  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end
end
