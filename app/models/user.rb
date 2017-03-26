class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable

  has_many :rabbis, through: :appointments
  has_many :appointments
  enum role: [:normal, :admin]
end
