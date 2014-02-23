class Standard
  include Mongoid::Document
  field :requirement, type: String
  field :description, type: String
end
