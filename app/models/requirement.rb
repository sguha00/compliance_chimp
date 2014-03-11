class Requirement
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  has_one :proof
end
