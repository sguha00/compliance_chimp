class ProofsController < ApplicationController

  def new
    @requirement = Requirement.find(params[:requirement_id])
    @proof = @requirement.proofs.build(user_id: current_user.id)
  end

  def create
    @requirement = Requirement.find(params[:requirement_id])
    @proof = @requirement.proofs.create(params[:proof])

    respond_to do |format|
      if @proof.save
        format.html { redirect_to user_url(current_user), notice: 'Proof was successfully attached.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
