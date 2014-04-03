class ProofsController < ApplicationController
  load_and_authorize_resource

  # GET /requirements/1/proofs/new
  def new
    @requirement = Requirement.find(params[:requirement_id])
    @proof = @requirement.proofs.build
  end

  # GET /proofs/1/edit
  def edit
    @proof = Proof.find(params[:id])
  end

  # POST /requirements/1/proofs
  def create
    @requirement = Requirement.find(params[:requirement_id])
    @proof = @requirement.proofs.build(params[:proof])
    @proof.user = current_user

    respond_to do |format|
      if @proof.save
        format.html { redirect_to requirements_url, notice: 'Proof was successfully attached.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /proofs/1
  def update
    @proof = Proof.find(params[:id])
    @proof.user = current_user
    old_filepicker_url = @proof.filepicker_url_was
    respond_to do |format|
      if @proof.update_attributes(params[:proof])
        format.html do
          redirect_url = @proof.filepicker_url != old_filepicker_url ? destroy_image_url(image_url: old_filepicker_url, message: "Proof was updated and old image was destroyed.") : requirements_url
          redirect_to redirect_url, notice: 'Proof was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end
end
