class UserSerializer < ActiveModel::Serializer
  attributes :id , :email, :name, :provider, :role, :wallet

  has_many :appointments#,  serializer: UserAppointmentSerializer
  #has_many :rabbis, through: :appointments
end
