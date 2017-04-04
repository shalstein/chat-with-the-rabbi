class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google]

  has_many :rabbis, through: :appointments
  has_many :appointments
  enum role: [:normal, :admin]

  validates :name, :wallet, presence: true
  validates :wallet, numericality: { only_integer: true}

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.provider = auth.provider
    end
  end

end
