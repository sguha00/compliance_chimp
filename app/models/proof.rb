class Proof
  include Mongoid::Document
  include Mongoid::Timestamps
  field :image_url, type: String
  belongs_to :requirement
end
