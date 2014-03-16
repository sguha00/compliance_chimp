class Requirement
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  has_many :proofs

  def user_proof(user)
    proofs.where(user: user).first
  end
end
