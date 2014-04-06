class RequirementSerializer < ActiveModel::Serializer
  attributes :id, :name, :description_short, :description_extended, :has_children, :proof_type, :testing_procedure, :guidance
  has_many :proofs, key: :current_proof

  def proofs
    object.proofs.where(user_id: current_user)
  end
end
