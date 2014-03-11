class ProofsController < ApplicationController

  def new
    @requirement = Requirement.find(params[:requirement_id])
    @proof = @requirement.build_proof
  end

  def create
    @requirement = Requirement.find(params[:requirement_id])
    @proof = @requirement.create_proof(params[:proof])

    respond_to do |format|
      if @proof.save
        format.html { redirect_to user_url(current_user), notice: 'Proof was successfully attached.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
