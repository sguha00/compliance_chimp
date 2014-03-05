class ProofsController < ApplicationController

  def new
    @standard = Standard.find(params[:standard_id])
    @proof = @standard.build_proof
  end

  def create
    @standard = Standard.find(params[:standard_id])
    @proof = @standard.create_proof(params[:proof])

    respond_to do |format|
      if @proof.save
        format.html { redirect_to user_url(current_user), notice: 'Proof was successfully attached.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
