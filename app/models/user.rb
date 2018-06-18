class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google]

  has_many :rabbis, through: :appointments
  has_many :appointments
  has_many :ChatMessages
  enum role: [:normal, :admin]

  validates :name, presence: true

  def serializer_fields_for_index
    "attributes :name"
  end




  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.provider = auth.provider
    end
  end

end
