class Proof
  include Mongoid::Document
  include Mongoid::Timestamps
  field :filepicker_url, type: String
  field :note, type: String
  attr_accessible :filepicker_url, :note
  belongs_to :requirement
  belongs_to :user

  delegate :name, to: :requirement, prefix: true

  validate :attached_image

  private

  def attached_image
    errors.add(:base, "You must attach an image to validate this proof") unless filepicker_url.present?
  end
end
