class RequirementsController < ApplicationController
  load_and_authorize_resource
  # GET /requirements
  # GET /requirements.pdf
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.pdf do
        pdf = RequirementsPdf.new(@requirements, view_context)
        send_data pdf.render, filename: "requirements_#{Date.today}.pdf",
                              type: 'application/pdf',
                              disposition: 'inline'
      end
      format.json { render json: @requirements }
    end
  end
end
