class User
  include Mongoid::Document
  rolify
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  has_many :proofs
  attr_accessible :role_ids, as: :admin
  attr_accessible :provider, :uid, :name, :email
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :update

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['nickname']
        user.email = auth['info']['email'] || ''
      end
    end
  end

  def admin?
    has_role? :admin
  end

  def proofs_count
    proofs.count
  end

  def name_and_email
    name + " (#{email})"
  end
end
