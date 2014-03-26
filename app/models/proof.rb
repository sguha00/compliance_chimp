class Proof
  include Mongoid::Document
  include Mongoid::Timestamps
  field :filepicker_url, type: String
  attr_accessible :filepicker_url
  belongs_to :requirement
  belongs_to :user

  delegate :name, to: :requirement, prefix: true
end
