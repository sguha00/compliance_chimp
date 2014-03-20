class Proof
  include Mongoid::Document
  include Mongoid::Timestamps
  field :image_url, type: String
  attr_accessible :image_url
  belongs_to :requirement
  belongs_to :user
end
