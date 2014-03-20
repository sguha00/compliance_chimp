class ProofsController < ApplicationController

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
    respond_to do |format|
      if @proof.update_attributes(params[:proof])
        format.html { redirect_to requirements_url, notice: 'Proof was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end
