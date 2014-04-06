class Api::V1::RequirementsController < ApplicationController
  def index
    @requirements = Requirement.all
    render json: @requirements
  end
end
